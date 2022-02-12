Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'f856fb9c33dbd33627ba', 'b986c8862f453682d5d07703095fed9a21e0d205'
end