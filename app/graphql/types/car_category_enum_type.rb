# frozen_string_literal: true

module Types
  class CarCategoryEnumType < Types::BaseEnum
    description 'Car category enum'

    value 'light_vhicle'
    value 'two_wheller'
    value 'medium_vahele'
    value 'heavy_whicle'
    value 'machinaries'
  end
end
