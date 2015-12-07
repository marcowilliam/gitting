RSpec.configure do |config|

  require 'omniauth'
  OmniAuth.config.test_mode = true
  omniauth_hash = { 'provider' => 'github',
                    'uid' => '12345',

                    'info' => {
                        'name' => 'Fulano',
                        'email' => 'fulano@dominio.com',
                        'nickname' => 'fulano'
                    },
                  }

  OmniAuth.config.add_mock(:github, omniauth_hash)

  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/config/'
    add_filter '/lib/'
    add_filter '/vendor/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Helpers', 'app/helpers'
    add_group 'Mailers', 'app/mailers'
    add_group 'Views', 'app/views'
  end

  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
