class AddUserToTvShows < ActiveRecord::Migration[5.0]
  def change
    add_reference :tv_shows, :user, foreign_key: true
  end
end
