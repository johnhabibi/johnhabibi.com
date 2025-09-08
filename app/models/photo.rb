class Photo < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :image, presence: true

  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :recent, -> { order(taken_at: :desc, created_at: :desc) }

  # Generate different image variants for responsive display
  def thumbnail
    image.variant(resize_to_limit: [400, 400], format: :webp, quality: 85)
  end

  def medium
    image.variant(resize_to_limit: [800, 600], format: :webp, quality: 90)
  end

  def large
    image.variant(resize_to_limit: [1200, 900], format: :webp, quality: 95)
  end

  def full_size
    image.variant(resize_to_limit: [2000, 1500], format: :webp, quality: 95)
  end

  # Auto-generate title from filename if not provided
  def self.create_from_file(file, category: nil, taken_at: nil)
    title = File.basename(file.original_filename, '.*').humanize

    create!(
      title: title,
      category: category,
      taken_at: taken_at || Time.current,
      image: file
    )
  end

  # Categories for organization
  CATEGORIES = [
    'Portraits',
    'Landscapes',
    'Street',
    'Architecture',
    'Nature',
    'Events',
    'Travel',
    'Abstract'
  ].freeze
end
