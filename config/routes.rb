Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      match 'doctors/search', to: "doctors#search", via: :get
    end
  end
end
