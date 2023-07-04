# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#     allow do
#       origins ['https://teeestreact.onrender.com','http://localhost', 'http://127.0.0.1'] # Replace with your React frontend domain
#       resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
#     end
#   end

  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ['https://teeestreact.onrender.com','http://localhost', 'http://127.0.0.1']
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end
  