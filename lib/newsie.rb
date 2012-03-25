# Requires
require "active_support/dependencies"

module Newsie
  
  # Our host application root path
  #We set this wehn the engine is initialized
  mattr_accessor :app_root
  
  #Yield self on setup for nice config blocks
  def self.setup
    yield self
  end

end

# Require our engine
require "newsie/engine"
