require "cenit/collection/slack/version"

module Cenit
  module Collection
    require "cenit/collection/slack/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/slack'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Slack.push_collection config
    # Cenit::Collection::Slack.shared_collection

    @slack = Cenit::Collection::Slack::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @slack.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@slack.shared_collection.to_json, config)
    end

    def self.show_collection
      @slack.shared_collection
    end

    def self.pull_collection (parameters,config)
      @slack.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@slack.sample_data(model).to_json, config)
    end
  end
end