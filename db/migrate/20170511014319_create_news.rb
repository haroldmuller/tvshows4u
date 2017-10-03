class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.references :user, foreign_key: true
      t.references :tv_show, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
