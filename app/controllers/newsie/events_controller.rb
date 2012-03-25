module Newsie
  class EventsController < ::ApplicationController
    def index
      @events = Event.all
    end
  end
end
