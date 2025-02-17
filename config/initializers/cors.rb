Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      puts "CORS middleware initialized"
      origins 'http://127.0.0.1:5173' # Vite dev server URL
      resource '*',
        headers: :any,
        expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end