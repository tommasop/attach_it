require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "bc91e0e334fe404cf9ca5526967358e727730f664ac7196243fe0c32fd967c05"

  url_format "/media/:job/:name"

  fetch_file_whitelist [  # List of allowed file paths when using fetch_file (strings or regexps)
    /public/
  ]

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
