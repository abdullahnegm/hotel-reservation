class User::ApiController < ApplicationController
    
    def authenticate_request
        @current_user = AuthorizeApiRequest.new(headers: request.headers, type: 'Customer').call
        return render_error('Token expired, Authorization failed!', :unauthorized) if @current_user.nil?
    
        @current_user
    end

end