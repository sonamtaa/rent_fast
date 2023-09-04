# frozen_string_literal: true

module MountQuery
  extend ActiveSupport::Concern

  class_methods do
    def mount_query(query_klass, **)
      field(
        query_klass.graphql_name.underscore.to_sym,
        resolver: query_klass,
        **
      )
    end
  end
end
