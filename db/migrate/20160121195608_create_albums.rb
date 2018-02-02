class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :cover_art
      t.belongs_to :publisher, index: true, foreign_key: true
      t.date :released_on

      t.timestamps null: false
    end
  end
end
