Rails.application.routes.draw do
  # get 'callbacks/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  # if you dont need the :id in the routes, then use "resource" not "resources"
  resource :session, only:[:new, :create, :destroy]
  # 'resource' is singular instead of 'resources'
  # Unlike 'resources', 'resource' will create routes that do CRUD operations
  # on only one thing. Also there will be no index routes, and no route
  # will have an ':id' wildcard. But the controller name is still plural

  resources :users, only: [:new, :create, :show]
  # get 'users/new'
  # get 'users/create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # ------------------------RESTful Routes----------------------------------
  # A RESTful route provides mapping from HTTP verbs (like GET, POST, PATCH, PUT, DELETE)
  # to the controller CRUD actions (create, read, update, destroy)

  # RESTful Routes for Questions resource
  # index: GET "/resources" - return all records of that resource
  # show: GET "/resources/:id" returns one instance of the resource
  # new: GET "/resources/new" - return a view page with form the create a resource
  # create: POST "/resources" -handle submission to the "new form" and inserts a new resource in the db
  # edit: GET "/resources/:id/edit" -returns a view to edit an existing resource
  # update: PATCH "/resource/:id" -handle submission of the "edit form" and update the resource with specific id in the db
  # destroy: DELETE "resources/:id" - delete a record with specific id from the database
  #------------------------------------------------------------------------------------

  # new
  # get 'questions/new'

  # create
  # post 'questions', to: 'question#create', as: :create_question

  # index
  # get 'questions', to: 'question#index'

  # show
  # get 'questions/:id', to: 'questions#show', as: :question

  # edit
  # get 'questions/:id/edit', to: 'questions#edit', as: :edit_question

  # update
  # patch 'questions/:id', to: 'questions#update'

  # destroy
  # delete 'questions/:id', to: 'question#destroy', as: :delete_question

  resources :questions do
    # Routes written inside of a block passed a resource method will be prefixed 
    # by a path corresponding to the passed in symbol
    # in this case, all nested routes will be prefixed with 'questions/:question_id'

    # post 'questions', to: 'questions#create', as: :create_question
    # /questions method post
    # /questions/:question_id/answers method post
    resources :answers, only: [:create, :destroy]
    # resources :answers, except: [:show, :new, :index, :edit, :update]

    resources :likes, shallow: true,  only: [:create, :destroy]
    #shallow: true changes the PATH of the created route
    #original route /question/:question_id/likes/:like_id
    #route with shallow: true -> likes/:like_id

    get :liked, on: :collection
    #the above route creates a path like: GET "/questions/liked"
    #similar to the questions index, but it will only show the questions liked by the current user
  end
  # ^^ this generates all the RESTful routes that CRUD requires for us
  # make sure to check /rails/info/routes

  # Testing
  resources :job_posts, only: [:new, :create, :show, :index, :edit, :update, :destroy]

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

  resources :likes, shallow: true, only: [:create, :destroy]

  # get :liked, on: :collection

  #Delayed_job routes:
  #We will see this route at this url: 'localhost:3000/delayed_job/overview'
  match(
    "delayed_job",
    to: DelayedJobWeb,
    anchor: false,
    via: [:get, :post]
  )

  #=======================API ROUTES===============>
  #The namespace method in Rails makes it so that your app will automatically
  #look in a directory called api, then in a sub directory called v1 for QuestionsController
  #api/v1/questions

  #The option 'defaults: {format: :json } will set json as the default response 
  #format for all routes contained within the block
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [:index, :show, :create, :update, :destroy]
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create] do
        # get('users/current', {to: 'users#current'})
        # default api/v1/users/:id/current
        get :current, on: :collection # api/v1/users/current
      end
    end
    # localhost:3000/api/v1/questions

    # namespace :v2 do
    #   resources :questions
    # end

    match "*unmatched_route", to:"application#not_found", via: :all
    #This route will match any URL that hasn't been matched already
    #inside the api namespace
    #The * prefix in the route path allows this wildcard to match anything
    #The via argument is required to specify whcih methods this route applies to
    #example: via: [:get, :post, :patch]
    #via all will match with all possible methods
  end

  #OmniAuth Routes
  get "/auth/github", as: :sign_in_with_github
  get "/auth/:provider/callback", to: "callbacks#index" 
  #note that :provider is dynamic, which will be replaced with the provider used to sign in
  #:provider will allow us to use the same controller and action for different authentication systems
  #such as github, twitter, facebook, etc.

end
