require_dependency 'api-auth'

module DoorkeeperSsoClient
  class ApplicationController < ActionController::Base
    before_filter :api_authenticate

    protect_from_forgery with: :null_session

  protected
    def api_authenticate
      api_key = ::ApiAuth.access_id(request)
      if ::DoorkeeperSsoClient::Config.oauth_client_id == api_key && ::ApiAuth.authentic?(request, ::DoorkeeperSsoClient::Config.oauth_client_secret)
        return true
      else
        head :forbidden
        return false
      end
    end
  end
end

