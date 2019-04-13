class AssemblyMailer < ApplicationMailer

  def new_dirty_assemblies(assembly_ids)
    @assemblies = Assembly.where(:id => assembly_ids)
    mail(to: "owner@example.com", subject: "New assemblies in need of maintenance")
  end
end
