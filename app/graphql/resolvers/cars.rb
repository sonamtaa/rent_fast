# frozen_string_literal: true

module Resolvers
  class Cars < SearchObjectBase
    description 'Fetches Cars from API'

    scope { Car.all }

    type Types::CarType.connection_type, null: true

    argument :skip, Integer, 'Used to offset the records', required: false

    option :car_type_filter, type: Types::CarCategoryEnumType, with: :car_type_filter, null: true,
                             description: <<~DESC
                               Supports filtering by car_type
                             DESC

    def car_type_filter(scope, _value)
      # FIXME: this is temporarily
      scope
    end
  end
end
