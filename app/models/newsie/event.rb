module Newsie
  class Event < ActiveRecord::Base
    attr_accessible :name, :content, :start_date, :end_date, :dismiss
    validates_presence_of :name
    # Search all events to see if any fit within date range of now
    def self.extra_extra
      return where("start_date <= ? AND end_date >= ?", Time.now().to_date, Time.now().to_date)
    end
    # Check to see if there is an event
    def self.event_today?
      return true if where("start_date <= ? AND end_date >= ?", Time.now().to_date, Time.now().to_date).count > 0
      return false
    end
    # Return any event today with without a start_date or end_date
    def self.just_in
      return where("start_date = NULL AND end_date = NULL AND created_at >= ?", Time.now().to_date).sort_by { |t| t.created_at }.last
    end
    # Return the most current event from today
    def self.most_current
      return self.extra_extra.sort_by { |t| t.start_date }.last
    end
  end
end
