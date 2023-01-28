# frozen_string_literal: true

module NameGenerator
  module Library
    class << self
      def get_names(type:, gender:, amount: 5)
        name_list = JSON.load_file("./data/names/#{type}.json")
        raise if name_list[gender].nil? || name_list[gender].empty?

        first_names = name_list[gender].sample(amount)
        last_names = (name_list["#{gender}_surname"] || name_list["surname"]).sample(amount)

        create_full_names(first_names:, last_names:)
      rescue
        []
      end

      private

      def create_full_names(first_names:, last_names:)
        first_names
          .zip(last_names)
          .map { |full_name| full_name.join(" ") }
      end
    end
  end
end
