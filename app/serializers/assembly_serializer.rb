class AssemblySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :needs_maintenance
  has_many :parts

  attribute :subassemblies do |a|
    a.children_assemblies
  end
end
