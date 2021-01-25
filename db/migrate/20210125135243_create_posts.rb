class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :track_name
      t.string :artists
      t.text :image
      t.text :preview_url
      t.text :description

      t.timestamps
    end
  end
end
