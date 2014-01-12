module Omniauth
  # Omniauth configuration for testing
  OmniAuth.config.test_mode = true

  # Twitter mock request return
  OmniAuth.config.add_mock(:twitter, {
    uid: '12345',
    provider: 'twitter',
    info: {
      name: 'hootgo_test',
      nickname: 'hootgo_test',
      image: 'http://hootgo.com/image-url.png'
    },
    credentials: {
      token: 'token',
      secret: 'secret'
    },
    extra: {
      raw_info: {
          lang: 'fr'
      }
    }
  })
end