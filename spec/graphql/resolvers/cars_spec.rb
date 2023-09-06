# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Cars, type: :request do
  let_it_be(:car_a) { create(:car) }
  let_it_be(:car_b) { create(:car) }

  context 'with all cars' do
    it 'lists all ars' do
      data, errors = execute(query, key: :cars)
      expect(errors).to be_nil
      expect(data.totalCount).to eq(2)
      expect(data.edges.pluck('node').pluck('id')).to contain_exactly(car_a.id, car_b.id)
    end
  end

  context 'with car type filter' do
    it 'lists all cars for that type' do
      data, errors = execute(query(car_type_filter: :light_vhicle), key: :cars)
      expect(errors).to be_nil
      expect(data.totalCount).to eq(2)
      # expect(OpenStruct.new(data.edges.pluck('node')[0])).to have_attributes(
      #
      # )
      # expect(OpenStruct.new(data.edges.pluck('node')[1])).to have_attributes(
      #
      # )
      expect(data.edges.pluck('node').pluck('id')).to contain_exactly(car_a.id, car_b.id)
    end
  end

  def query(args = {})
    <<~GQL
      query {
        cars #{query_string(args)}{
          totalCount
          edges {
            node {
             id
             title
             engineNumber
            }
          }
        }
      }
    GQL
  end
end
