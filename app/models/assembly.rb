class Assembly < ActiveRecord::Base
  has_many :part_manifests
  has_many :parts, through: :part_manifests
  has_many :assembly_manifests
  has_many :parent_assemblies, through: :assembly_manifests

  scope :top_level, -> { joins("join assembly_manifests on assemblies.id = assembly_manifests.parent_assembly_id").merge(AssemblyManifest.with_top_level_parents).uniq }
  scope :needs_maintenance, -> { where(:needs_maintenance => true) }

  # all subassemblies below this one
  def all_descendants
    [children_assemblies, children_assemblies.map(&:all_descendants)].flatten.compact
  end

  # 1-level down subassembles
  def children_assemblies
    Assembly.joins(:assembly_manifests).merge(AssemblyManifest.where(:parent_assembly_id => self.id))
  end

  # our parent and all of its parents
  def all_parents
    [parent_assemblies, parent_assemblies.map(&:all_parents)].flatten.compact
  end

end
