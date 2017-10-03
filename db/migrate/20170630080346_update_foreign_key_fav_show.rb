class UpdateForeignKeyFavShow < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    remove_foreign_key :fav_shows, :users
    remove_foreign_key :fav_shows, :tv_shows

    # add the new foreign_key
    add_foreign_key :fav_shows, :users, on_delete: :cascade
    add_foreign_key :fav_shows, :tv_shows, on_delete: :cascade
  end
end
