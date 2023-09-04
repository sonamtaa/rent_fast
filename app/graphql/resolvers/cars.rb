# frozen_string_literal: true

module Resolvers
  class Cars < GraphQL::Schema::Resolver
    description 'Fetches Cars from API'

    type Types::Cars.connection_type, null: true

    # argument :skip, Integer, 'Used to offset the records', required: false
    # argument :ticket_id, ID, 'ID of ticket', required: false

    def resolve(**args)
      cars = Car.all.order(created_at: :desc)
      # args[:skip] ? cars.offset(args[:skip]) : cars
      cars
    end
  end
end
