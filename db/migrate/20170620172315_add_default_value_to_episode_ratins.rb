class AddDefaultValueToEpisodeRatins < ActiveRecord::Migration[5.0]
  def up
   change_column_default :episode_ratins, :favorite, false
   change_column_default :episode_ratins, :seen, false
 end

 def down
   change_column_default :episode_ratins, :favorite, nil
   change_column_default :episode_ratins, :seen, nil
 end
end
