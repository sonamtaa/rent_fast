# frozen_string_literal: true

require 'search_object/plugin/graphql'

module Resolvers
  class SearchObjectBase < GraphQL::Schema::Resolver
    include SearchObject.module(:graphql)

    option(:skip, type: Int) { |scope, value| scope.offset(value) }

    def insert_nil(values)
      values.map! { |value| value == 'blank' ? nil : value }
    end

    def self.toggle_input_object(name, argument_type)
      Class.new(GraphQL::Schema::InputObject) do
        graphql_name "#{name}ToggleFilter"

        argument :select, Boolean, required: true
        argument :value, argument_type, required: true
      end
    end
  end
end
