class CreateEpisodeComments < ActiveRecord::Migration[5.0]
  def change
    create_table :episode_comments do |t|
      t.references :user, foreign_key: true
      t.references :episode, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
