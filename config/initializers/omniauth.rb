Wiki::Application.config.middleware.use OmniAuth::Builder do
  provider :github, 'ac4daa281db9085c8996', '4603b46da61284be66743083dc7c0ce1c4168081'
end