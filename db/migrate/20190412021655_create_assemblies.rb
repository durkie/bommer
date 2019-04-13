class CreateAssemblies < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.string :name
      t.boolean :needs_maintenance, default: false
      t.timestamps null: false
    end
  end
end
