module Newsie
  class Event < ActiveRecord::Base
    
    attr_accessible :name, :content, :start_date, :end_date, :dismiss
    validates_presence_of :name

    # Using find, return all events by name, otherwise return individual event by id
    def self.find(event)
      if event.is_a? String
        Event.find_all_by_name(event)
      else
        super
      end
    end
    
    # Return all events happening right now
    def self.extra_extra
      return where("start_date <= ? AND end_date >= ?", Time.now, Time.now)
    end
    
    # Check to see if any events are happening right now
    def self.extra_extra?
      return where("start_date <= ? AND end_date >= ?", Time.now, Time.now).count > 0
    end
    
    # Return most recently added event
    def self.just_in
      return where( 'created_at <= ?', Time.now ).order('created_at DESC').first
    end
    
    # Return an event happening right now that started most recently
    def self.most_current
      return self.extra_extra.order('start_date DESC').first
    end

  end
end
