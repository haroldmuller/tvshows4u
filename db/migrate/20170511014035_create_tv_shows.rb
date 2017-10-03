class CreateTvShows < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.string :description
      t.string :country
      t.string :language

      t.timestamps
    end
  end
end
