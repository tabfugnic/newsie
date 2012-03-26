module Newsie
  class Event < ActiveRecord::Base
    attr_accessible :name, :content, :start_date, :end_date, :dismiss
    # Search all events to see if any fit within date range
    def self.extra_extra 
      p all
      p Time.now()
      where("start_date <= #{Time.now().to_date} AND end_date >= #{Time.now().to_date}")
    end
    def self.event_today?
      return true if where("start_date <= #{Time.now().to_date} AND end_date >= #{Time.now().to_date}").count > 0
      return false
    end
  end
end
