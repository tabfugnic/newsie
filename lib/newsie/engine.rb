module Newsie
  class Engine < Rails::Engine
    initialize "newsie.load_app_instance_data" do |app|
      Newsie.setup do |config|
       config.app_root = app.root
      end
    end
    initialize "newsie.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
