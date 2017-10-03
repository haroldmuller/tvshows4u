class AddGenresTvShowsJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :genres_tv_shows, :id => false do |t|
      t.integer "genre_id"
      t.integer "tv_shows_id"
    end
    add_index :genres_tv_shows, ["genre_id", "tv_shows_id"]
  end
end
