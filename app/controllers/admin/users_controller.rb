class Admin::UsersController < Admin::ApiController
    def create 
        user = User.new(registration_user_params)
        user.save!
        
        render_success('user', user, :ok)
    end

    private 
    
    def registration_user_params
        params.permit(:name, :username, :password, :phone_number, :ssn, :admin)
    end
end