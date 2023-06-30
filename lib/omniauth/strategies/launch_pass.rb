require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class LaunchPass < OmniAuth::Strategies::OAuth2
      option :name, 'launch_pass'

      option :client_options, {
        site: "https://launchpass.launchacademy.com",
        authorize_url: "/oauth/authorize",
      }

      option :authorize_params, {
        signing_up: nil,
        scope: "public"
      }

      uid { raw_info["id"].to_s }

      info do
        raw_info
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def setup_phase
        request.env['omniauth.strategy'].options[:authorize_params][:signing_up] =  request.params["signing_up"]
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'launch_pass', 'LaunchPass'
