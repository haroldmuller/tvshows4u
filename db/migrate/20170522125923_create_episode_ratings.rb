class CreateEpisodeRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :episode_ratings do |t|
      t.integer :ranting
      t.boolean :favorite
      t.boolean :seen
      t.references :user, foreign_key: true
      t.references :episode, foreign_key: true

      t.timestamps
    end
  end
end
