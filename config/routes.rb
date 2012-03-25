Rails.application.routes.draw do
  get "newsie" => "newsie/events#index", :as => :newsie
end
