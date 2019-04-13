# require 'sidekiq'
#
# Sidekiq.configure_client do |config|
#   config.client_middleware do |chain|
#     chain.add Sidekiq::Status::ClientMiddleware, expiration: 60.minutes
#   end
# end
#
# Sidekiq.configure_server do |config|
#   config.server_middleware do |chain|
#     chain.add Sidekiq::Status::ServerMiddleware, expiration: 60.minutes
#   end
#   config.client_middleware do |chain|
#     chain.add Sidekiq::Status::ClientMiddleware, expiration: 60.minutes
#   end
#
#   schedule_file = "config/schedule.yml"
#   if File.exists?(schedule_file)
#     Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
#   end
# end
