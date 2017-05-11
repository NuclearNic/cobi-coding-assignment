class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :author_id
      t.integer :genre_id
      t.string :title
      t.text :description
      t.string :cover_art
      t.text :cover_art_base_64

      t.timestamps
    end
    add_index :books, :author_id
    add_index :books, :genre_id
    add_index :books, :title
  end
end
