Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ['https://teeestreact.onrender.com', 'http://localhost:5174'] # Replace with your React frontend domain
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  end
  