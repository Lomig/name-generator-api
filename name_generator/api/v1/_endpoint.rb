# frozen_string_literal: true

module NameGenerator::Api::V1
  class Endpoint
    STATUSES = {
      ok: 200,
      created: 201,
      not_found: 404
    }.freeze

    private attr_reader :params

    def call(env)
      @params = env["router.params"]
      action
    end

    private

    def respond(data, headers: {"Content-Type" => "application/json"}, status: 200)
      status = STATUSES[status] unless status.is_a?(Integer)
      [status, headers, [data]]
    end
  end
end
