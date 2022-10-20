Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # When users type "localhost:3000" 
  # it sends a http get request to this path "localhost:3000", 
  # which is rails' default server when running "rails s"
  # The http get request will be handled by the "WelcomeController" in the "index" action

  # get('/', {to: 'welcome#index'})
  root "welcome#index" #root can be used to indicated the default root page, same as the request above

  get "/welcome", to: "welcome#index"

  get "/goodbye", to: "welcome#goodbye", as: :what #:as option give you the ability to give an alias to a specific path

  # when directing a route in a view page, you give it a path to access the route: 
  #(see views/layouts/application.html.erb for the navigation paths as examples)
  # goodbye_url => http://localhost:3000/goodbye
  # goodbye_path => /goodbye

  #to see all the paths, aliases, verbs, and controller#action's associated with each other,
  #go to the following in the browser: http://localhost:3000/rails/info/routes

  get "form_example", to: "welcome#form_example"

  # get('/question/:id') #dynamic id's will replace :id with the number or params given in url

end
