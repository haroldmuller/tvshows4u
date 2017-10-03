class CreateTvShowRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_show_ratings do |t|
      t.integer :ranting
      t.boolean :favorite
      t.references :user, foreign_key: true
      t.references :tv_show, foreign_key: true

      t.timestamps
    end
  end
end
