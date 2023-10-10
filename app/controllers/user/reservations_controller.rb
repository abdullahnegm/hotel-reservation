class User::ReservationsController < User::ApiController

    def create
        reservation = @current_user.reservations.new(create_reservation_params)
        reservation.save!

        render_success('reservation', reservation, :ok)
    end

    def destroy
        reservation = @current_user.reservations.find(params[:id]).delete
        
        render_success('reservation', reservation, :ok)
    end

    private 
    
    def create_reservation_params
        params.permit(:room_id, :date_from, :date_to)
    end
end