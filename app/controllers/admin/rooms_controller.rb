class Admin::RoomsController < Admin::ApiController

    def create
        room = Room.new(create_room_params)
        room.save!

        render_success('room', room, :ok)
    end

    private
    
    def create_room_params
        params.permit(:number, :price, :room_type, :floor_number)
    end
end