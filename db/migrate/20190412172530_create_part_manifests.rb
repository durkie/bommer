class CreatePartManifests < ActiveRecord::Migration
  def change
    create_table :part_manifests do |t|
      t.belongs_to :part, index: true
      t.belongs_to :assembly, index: true
      t.timestamps null: false
    end
  end
end
