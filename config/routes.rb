Rails.application.routes.draw do
  post   '/citymaps/create' => 'city_maps#create'
  get    '/routes/find'     => 'routes#find'
end
