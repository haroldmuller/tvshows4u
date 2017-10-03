class CreateTvShowComments < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_show_comments do |t|
      t.references :user, foreign_key: true
      t.references :tv_show, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
