class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :isbn
      t.string :genre
      t.date :publish_date
      t.integer :num_page
      t.string :image_url
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
