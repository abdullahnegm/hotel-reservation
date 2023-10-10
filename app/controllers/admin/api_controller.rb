class Admin::ApiController < ApplicationController

    def authenticate_request
        @current_user = AuthorizeApiRequest.new(headers: request.headers, type: 'Admin').call
        return render_error('Token expired, Authorization failed!', :unauthorized) if @current_user.nil?
    
        @current_user
    end

end