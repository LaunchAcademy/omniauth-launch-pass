require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class ICode < OmniAuth::Strategies::OAuth2
      option :name, :icode

      option :client_options, {
        site_url: "http://icode.launchacademy.com",
        authorize_url: "/oauth/authorize"
      }
      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"],
          name: [raw_info["first_name"], raw_info["last_name"]].join(' ')
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
