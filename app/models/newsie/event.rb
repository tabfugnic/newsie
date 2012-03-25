module Newsie
  class Event < ActiveRecord::Base
    attr_accessible :name, :content, :start_date, :end_date
  end
end
