# frozen_string_literal: true

module MountMutation
  extend ActiveSupport::Concern

  class_methods do
    def mount_mutation(mutation_class, **)
      field(
        mutation_class.graphql_name.underscore.to_sym,
        mutation: mutation_class,
        **
      )
    end
  end
end
