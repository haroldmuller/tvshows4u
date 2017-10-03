class AddActorsTvShowsJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :actors_tv_shows, :id => false do |t|
      t.integer "actor_id"
      t.integer "tv_shows_id"
    end
    add_index :actors_tv_shows, ["actor_id", "tv_shows_id"]
  end
end
