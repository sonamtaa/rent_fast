# frozen_string_literal: true

def json
  result = JSON.parse(response.body)
  result.is_a?(Array) ? result : ActiveSupport::HashWithIndifferentAccess.new(result)
end

def open_struct(data)
  OpenStruct.new(data)
end

def run_task(task_name)
  Rake::Task[task_name].execute
end

# frozen_string_literal: true

def execute(query, variables: {}, key: nil)
  post '/graphql', params: { query:, variables: }

  response_body = RecursiveOpenStruct.new(JSON.parse(response.body))
  [
    key ? response_body.dig(:data, key) : response_body.data,
    response_body.errors
  ]
end

def header_params(args = {})
  { Authorization: args[:token], Accept: 'Application/json', HTTP_ACCEPT_LANGUAGE: args[:locale] || 'en' }
end

def query_string(params)
  return if params.blank?

  array = reduce_params(params)
  array.try { |item| "(#{item.join(',')})" }
end

def reduce_params(params)
  params.reduce([]) do |arr, param|
    key, value = param
    formatted = formatted_value(value)

    arr << "#{key.to_s.camelize(:lower)}:#{formatted}"
  end
end

def formatted_value(value) # rubocop:disable Metrics/MethodLength
  case value.class.to_s
  when 'String'
    "\"#{value}\""
  when 'Symbol'
    value.to_s
  when 'Array'
    value.to_s.split(':').join
  when 'Hash'
    "{#{query_string(value).delete('()')}}"
  else
    value
  end
end

def n_workdays_ago(date, days)
  if date.wday.zero?
    n_workdays_ago(date.prev_day(2), days)
  elsif date.wday == 6
    n_workdays_ago(date.prev_day(1), days)
  else
    return date if days == 0

    n_workdays_ago(date.prev_day(1), (days - 1))
  end
end
