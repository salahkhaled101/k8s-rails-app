require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module Drkiq
  class Application < Rails::Application



    config.log_level = :debug
    config.log_tags  = [:subdomain, :uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))


    config.cache_store = :redis_store, ENV['CACHE_URL'],
                     { namespace: 'drkiq::cache' }

    config.active_job.queue_adapter = :sidekiq


    config.active_record.raise_in_transactional_callbacks = true
  end
end

