class PartManifest < ActiveRecord::Base
  belongs_to :part
  belongs_to :assembly

  before_destroy :flag_assembly_maintenance

  # If a part is deleted, flag its direct assembly for maintenance
  def flag_assembly_maintenance
    self.assembly.update_attributes!(:needs_maintenance => true) if self.assembly.present?
  end
end
