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
