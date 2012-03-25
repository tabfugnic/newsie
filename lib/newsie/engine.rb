module Newsie
  class Engine < Rails::Engine
    initializer "newsie.load_app_instance_data" do |app|
      Newsie.setup do |config|
       config.app_root = app.root
      end
    end
    initializer "newsie.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
