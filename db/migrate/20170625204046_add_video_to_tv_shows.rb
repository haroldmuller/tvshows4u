class AddVideoToTvShows < ActiveRecord::Migration[5.0]
  def change
    add_column :tv_shows, :url, :string
    add_column :tv_shows, :final_url, :string
  end
end
