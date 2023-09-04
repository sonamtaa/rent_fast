# frozen_string_literal: true

module Resolvers
  class ActivityLogs < GraphQL::Schema::Resolver
    description 'Fetches activity log for given ticket ID'

    type Types::ActivityLog.connection_type, null: true

    argument :skip, Integer, 'Used to offset the records', required: false
    argument :ticket_id, ID, 'ID of ticket', required: false

    def resolve(**args)
      activity_logs = ActivityLog.where(loggable_id: args[:ticket_id], loggable_type: 'Ticket').order(created_at: :desc)
      args[:skip] ? activity_logs.offset(args[:skip]) : activity_logs
    end
  end
end
