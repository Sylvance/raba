# config/sidekiq.rb

sidekiq_config = { url: ENV['REDIS_URL'] }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
  config.logger.formatter = Sidekiq::Logger::Formatters::JSON.new

  config.on(:startup) do
    Rails.logger.info('Sidekiq is starting up.')
  end

  config.on(:shutdown) do
    Rails.logger.info('Sidekiq is shutting down.')
  end
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
