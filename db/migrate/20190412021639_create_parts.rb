class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :part_id
      t.timestamps null: false
    end

    add_index :parts, :part_id, unique: true
  end
end
