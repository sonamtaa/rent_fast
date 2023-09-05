# frozen_string_literal: true

module Types
  class CarType < Types::BaseObject
    field :id, ID
    field :title, String
    field :engine_number, String
    field :registration_no, String
  end
end
