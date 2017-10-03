class CreateEpisodeRatins < ActiveRecord::Migration[5.0]
  def change
    create_table :episode_ratins do |t|
      t.integer :rating
      t.boolean :favorite
      t.boolean :seen
      t.references :user, foreign_key: true
      t.references :episode, foreign_key: true

      t.timestamps
    end
  end
end
