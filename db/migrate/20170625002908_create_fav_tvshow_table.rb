class CreateFavTvshowTable < ActiveRecord::Migration[5.0]
  def change
    create_table :fav_tvshows do |t|
      t.references :tv_show, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :favorite
    end
  end
end
