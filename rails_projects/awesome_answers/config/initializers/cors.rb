Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '127.0.0.1:5500', 'localhost:5500', '127.0.0.1:9999', 'localhost:9999'  # whitelist domains
    resource(
      '/api/*', # limit requests to paths that look like /api
      headers: :any, # all the requests to contain any headers
      credentials: true, # because we're sending cookies with CORS we must add this flag
      methods: [:get, :post, :patch, :put, :options, :delete] # allow these http verbs
    )
  end
end