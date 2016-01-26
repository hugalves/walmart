Rails.application.routes.draw do
  post   '/maps/create' => 'maps#create'
  get    '/routes/find' => 'routes#find'
  delete '/maps/all'    => 'maps#delete'
end
