class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end