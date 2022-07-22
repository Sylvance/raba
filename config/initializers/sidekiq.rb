# config/sidekiq.rb

sidekiq_config = { url: ENV['REDIS_URL'] }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
  config.logger.formatter = Sidekiq::Logger::Formatters::JSON.new

  config.on(:startup) do
    FileUtils.touch(Rails.root.join("tmp", "pids", "sidekiq_started"))
  end

  config.on(:shutdown) do
    FileUtils.rm(Rails.root.join("tmp", "pids", "sidekiq_started"))
  end
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
