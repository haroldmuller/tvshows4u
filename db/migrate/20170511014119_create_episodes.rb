class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :season
      t.string :description
      t.integer :duration
      t.integer :release_year

      t.timestamps
    end
  end
end
