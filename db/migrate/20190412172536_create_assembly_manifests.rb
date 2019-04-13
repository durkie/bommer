class CreateAssemblyManifests < ActiveRecord::Migration
  def change
    create_table :assembly_manifests do |t|
      t.references :parent_assembly, index: true
      t.belongs_to :assembly
      t.timestamps null: false
    end
  end
end
