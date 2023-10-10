class SessionsController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]

    # User classic login with email and password
    def create
        # First decode the JWT for the new logic session
        auth_token = AuthenticateUser.new(
            username: params[:username]&.downcase,
            password: params[:password]
        ).call

        user = User.find_by_username(params[:username])

        render_success('user', {user: user, auth_token: auth_token}, :ok)
    end
end