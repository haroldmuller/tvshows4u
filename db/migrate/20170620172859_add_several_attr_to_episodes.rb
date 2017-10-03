class AddSeveralAttrToEpisodes < ActiveRecord::Migration[5.0]
  def change
   change_table :episodes do |t|
     t.boolean "favorite"
     t.boolean "seen"
     t.integer "rating"
   end
   change_column_default :episodes, :favorite, false
   change_column_default :episodes, :seen, false
   change_column_default :episodes, :favorite, nil
 end
end
