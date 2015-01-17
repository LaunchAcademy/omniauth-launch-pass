require 'spec_helper'

describe OmniAuth::Strategies::LaunchPass do
  let(:app) do
    lambda { [ 200, {}, ["Hello"] ] }
  end
  let(:request) do
    mock.tap do |m|
      m.stubs(:env).returns({})
      m.stubs(:params).returns({})
      m.stubs(:cookies).returns({})
    end
  end

  let(:strategy) do
    OmniAuth::Strategies::LaunchPass.new(app, 'app_id', 'secret_key').tap do |s|
      s.stubs(:request).returns(request)
    end
  end

  let(:access_token) do
    mock.tap do |m|
      m.stubs(:options).returns({})
      m.stubs(:token).returns(ENV['LAUNCH_PASS_TOKEN'])
      m.stubs(:expires?).returns(false)
      m.stubs(:get).returns(response)
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  it 'points to the correct url' do
    expect(strategy.client.site).
      to eq('https://launchpass.launchacademy.com')
  end
end
