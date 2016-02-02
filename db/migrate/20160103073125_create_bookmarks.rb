class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :url_link_text
      t.string :url_description
      t.references :topic, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
