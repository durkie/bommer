class PartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :part_id
  has_many :assemblies

  attribute :dependent_assemblies do |part|
    part.dependent_assemblies
  end
end
