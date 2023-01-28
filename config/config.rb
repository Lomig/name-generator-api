# frozen_string_literal: true

module NameGenerator
  module Api
    module V1
      module Names; end
    end
  end
end

$LOAD_PATH.unshift File.expand_path(".")

require "name_generator/library"
require "name_generator/api/v1/_endpoint"
require "name_generator/api/v1/names/index"
