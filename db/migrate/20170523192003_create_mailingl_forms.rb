class CreateMailinglForms < ActiveRecord::Migration[5.0]
  def change
    create_table :mailingl_forms do |t|
      t.string :subject
      t.string :body
      t.string :to

      t.timestamps
    end
  end
end
