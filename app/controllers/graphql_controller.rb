# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    render json: result
  end

  private

  def result
    RentFastSchema.execute(
      params[:query],
      variables: prepare_variables(params[:variables]),
      context: { controller: self },
      operation_name: params[:operationName]
    )
  end

  def prepare_variables(param)
    case param
    when String then parse_string(param)
    when Hash then param
    when ActionController::Parameters then param.to_unsafe_hash
    when nil then {}
    else raise ArgumentError, "Unexpected parameter: #{param}"
    end
  end

  def parse_string(param)
    param.present? ? (JSON.parse(param) || {}) : {}
  end

  rescue_from StandardError do |error|
    raise error unless Rails.env.production?

    Rollbar.error(error)
    render json: { message: 'Internal Server Error' }, status: :internal_server_error
  end
end
