Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"]
  scope: "read:org"
end
