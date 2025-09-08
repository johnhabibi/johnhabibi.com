class CreatePhotos < ActiveRecord::Migration[7.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :category
      t.datetime :taken_at

      t.timestamps
    end
  end
end
