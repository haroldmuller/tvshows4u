class AddTvShowToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :episodes, :tv_show, foreign_key: true
  end
end
