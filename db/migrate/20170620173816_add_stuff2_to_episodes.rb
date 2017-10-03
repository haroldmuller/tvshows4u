class AddStuff2ToEpisodes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :episodes, :favorite, false
  end
end
