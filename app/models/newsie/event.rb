module Newsie
  class Event < ActiveRecord::Base
    attr_accessible :name, :content, :start_date, :end_date, :dismiss
    validates_presence_of :name
    # Search all events to see if any fit within date range
    def self.extra_extra
      return where("start_date <= ? AND end_date >= ?", Time.now().to_date, Time.now().to_date)
    end
    def self.event_today?
      return true if where("start_date <= ? AND end_date >= ?", Time.now().to_date, Time.now().to_date).count > 0
      return false
    end
  end
end
