# frozen_string_literal: true

require "bundler/setup"
require "hanami/api"

require "./config/config"

class NameGeneratorService < Hanami::API
  scope :api do
    scope :v1 do
      get "names/:type/:gender", to: NameGenerator::Api::V1::Names::Index.new
    end
  end
end

run NameGeneratorService.new
