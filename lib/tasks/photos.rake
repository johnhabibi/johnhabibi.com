namespace :photos do
  desc "Create sample photos for testing the gallery"
  task seed: :environment do
    puts "Creating sample photos..."

    sample_photos = [
      {
        title: "Urban Sunset",
        description: "Golden hour captures the city's architectural beauty in warm, ethereal light.",
        category: "Architecture",
        taken_at: 2.weeks.ago
      },
      {
        title: "Morning Coffee",
        description: "A quiet moment of reflection captured in soft morning light.",
        category: "Portraits",
        taken_at: 1.week.ago
      },
      {
        title: "Mountain Vista",
        description: "Vast landscapes that remind us of nature's incredible scale and beauty.",
        category: "Landscapes",
        taken_at: 3.days.ago
      },
      {
        title: "Street Corner",
        description: "Life in motion—spontaneous moments that tell stories of human connection.",
        category: "Street",
        taken_at: 1.day.ago
      }
    ]

    sample_photos.each do |photo_data|
      # Create a simple colored rectangle as placeholder
      photo = Photo.create!(photo_data)

      # In a real scenario, you'd attach actual image files here
      # For now, we'll create placeholder entries
      puts "Created photo: #{photo.title}"
    end

    puts "Sample photos created successfully!"
    puts "Note: To add actual images, use the admin interface at /admin"
  end
end
