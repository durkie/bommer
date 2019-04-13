class AssemblyManifest < ActiveRecord::Base
  belongs_to :parent_assembly, class_name: "Assembly"
  belongs_to :assembly

  # Returns all AssemblyManifests that point to our top-level (parentless) assemblies
  # An AssemblyManifest is basically a [parent_assembly_id, assembly_id] tuple, so top-level parents
  # are those that exist as parent_assembly_ids but not as an assembly_id
  scope :with_top_level_parents, -> {
    where("parent_assembly_id not in (?)", AssemblyManifest.pluck(:assembly_id).uniq)
  }

end
