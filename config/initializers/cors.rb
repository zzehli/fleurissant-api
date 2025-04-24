Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
    origins Rails.env.production? ? 'https://jaeli.space/' : 'http://localhost:5173' # Use different origins for production and development
      resource '*',
        headers: :any,
        expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end