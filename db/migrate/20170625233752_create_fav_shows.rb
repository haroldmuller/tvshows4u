class CreateFavShows < ActiveRecord::Migration[5.0]
  def change
    create_table :fav_shows do |t|
      t.references :user, foreign_key: true
      t.references :tv_show, foreign_key: true
      t.boolean :favorite

      t.timestamps
    end
  end
end
