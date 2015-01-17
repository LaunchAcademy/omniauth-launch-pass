require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class LaunchPass < OmniAuth::Strategies::OAuth2
      option :name, 'launch_pass'

      option :client_options, {
        site: "https://launchpass.launchacademy.com",
        authorize_url: "/oauth/authorize"
      }

      uid { raw_info["id"].to_s }

      info do
        {
          email: raw_info["email"],
          first_name: raw_info["first_name"],
          last_name: raw_info["last_name"],
          teams: raw_info["teams"],
          product_offerings: raw_info["product_offerings"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'launch_pass', 'LaunchPass'
