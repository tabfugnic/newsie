module Newsie
  class Event < ActiveRecord::Base
    
    attr_accessible :name, :content, :start_date, :end_date, :dismiss
    validates_presence_of :name
    
    # Return all events happening right now
    def self.extra_extra
      return where("start_date <= ? AND end_date >= ?", Time.now, Time.now)
    end
    
    # Check to see if any events are happening right now
    def self.extra_extra?
      return where("start_date <= ? AND end_date >= ?", Time.now, Time.now).count > 0
    end
    
    # Return a one off event, currently denoted by no start date and end date and created within the past day
    def self.just_in
      return where( "start_date == nil AND end_date == nil AND created_at >= ?", Time.now - 1.day )
    end
    
    # Return a one off event, the most current event  started most recently
    def self.most_current
      return self.extra_extra.sort_by { |t| t.start_date }.last
    end
  end
end
