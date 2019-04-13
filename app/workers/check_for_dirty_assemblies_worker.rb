class CheckForDirtyAssembliesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false, :backtrace => 10

  def perform
    assembly_ids = Assembly.needs_maintenance.pluck(:id)
    AssemblyMailer.new_dirty_assemblies(assembly_ids).deliver_later(wait: 1.minute) if assembly_ids.any?
  end
end
