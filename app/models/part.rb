class Part < ActiveRecord::Base
  has_many :part_manifests, dependent: :destroy
  has_many :assemblies, through: :part_manifests

  scope :in_use, -> { joins(:part_manifests).uniq }

  # Find parts with no PartManifest, ie, not part of any assemblies.
  def self.orphaned
    manifest_table = PartManifest.table_name
    part_table = self.table_name
    joins("LEFT JOIN #{manifest_table} on #{part_table}.id = #{manifest_table}.part_id").where ("#{manifest_table}.part_id is null")
  end

  # Find all parents of our direct assemblies. Not ideal in the model.
  def dependent_assemblies
    [self.assemblies, self.assemblies.map(&:all_parents)].flatten.compact
  end
end
