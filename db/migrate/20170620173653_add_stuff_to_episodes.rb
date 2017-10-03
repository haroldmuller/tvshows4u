class AddStuffToEpisodes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :episodes, :seen, false
  end
end
