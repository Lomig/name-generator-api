# frozen_string_literal: true

module NameGenerator::Api::V1
  class Names::Index < Endpoint
    def action
      names = NameGenerator::Library.get_names(type: params[:type], gender: params[:gender])
      return error if names.empty?

      respond names.to_json
    end

    private

    def error
      error_message = "Cannot find name for type '#{params[:type]}' and gender '#{params[:gender]}'"
      respond [error_message].to_json, status: :not_found
    end
  end
end
