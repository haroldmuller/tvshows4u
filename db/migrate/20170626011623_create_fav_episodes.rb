class CreateFavEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :fav_episodes do |t|
      t.references :user, foreign_key: true
      t.references :episode, foreign_key: true
      t.boolean :favorite

      t.timestamps
    end
  end
end
