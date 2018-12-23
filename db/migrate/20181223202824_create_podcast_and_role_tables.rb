class CreatePodcastAndRoleTables < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :description 
      t.string :cover_art_url
      t.string :rss_url
      t.string :services
      t.timestamps
    end

    create_table :podcast_roles do |t|
      t.integer :podcast_id
      t.integer :user_ud 
      t.string :role
      t.timestamps
    end
  end
end
