class AddDirectorToTvShows < ActiveRecord::Migration[5.0]
  def change
    add_reference :tv_shows, :director, foreign_key: true
  end
end
