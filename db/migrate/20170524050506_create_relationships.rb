class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :father_id
      t.integer :child_id

      t.timestamps
    end
    add_index :relationships, :father_id
    add_index :relationships, :child_id
    add_index :relationships, [:father_id, :child_id], unique: true
  end
end
