module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ slack build ]), File.dirname(__FILE__))
    require "cenit/client"

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
      Cenit::Client.push(@slack.sample_model(model).to_json, config)
    end

    def self.import(data)
      @slack.import_data(data)
    end
  end
end