class Room < ApplicationRecord

    has_many :reservations

    enum room_type: {single: 0, double: 1, suite: 2}
    
    validates :number, :price, :room_type, :floor_number, presence: true
    validates :price, numericality: { only_integer: true, greater_than: 0 }
    validates :number, uniqueness: { scope: :floor_number, message: "is already created on that floor" }
end