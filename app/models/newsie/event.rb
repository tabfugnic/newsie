module Newsie
  class Event < ActiveRecord::Base
    attr_accessible :name, :content, :start_date, :end_date, :dismiss
    # Search all events to see if any fit within date range
    def self.extra_extra 
      self.all.each do |e|
        if e.start_date <= Time.now()
          return e.content
        end
      end
    end
  end
end
