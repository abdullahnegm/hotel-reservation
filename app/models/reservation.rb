class Reservation < ApplicationRecord

    belongs_to :user
    belongs_to :room

    validates :room_id, :date_from, :date_to, presence: true

    validate :dates_do_not_overlap_with_another_reservation

    def dates_do_not_overlap_with_another_reservation
        errors.add(:invalid_date, "format.") unless validate_date(date_from) && validate_date(date_to)
        errors.add(:invalid_date, "range.") if date_to.to_date < date_from.to_date
        # existing_reservation = room.reservations.where(date_from: date_from.to_date..date_to.to_date).or(room.reservations.where(date_to: date_from.to_date..date_to.to_date)).first
        existing_reservation = room.reservations.where("date_from <= ? AND date_to > ?", date_from, date_from).or(room.reservations.where("date_from < ? AND date_to >= ?", date_to, date_to)).first
        errors.add(:has_overlapping_date, "Room is reserved from #{existing_reservation.date_from} to #{existing_reservation.date_to}") if existing_reservation.present?
    end

    def validate_date date
        begin
            date.to_s.match(/\d{4}-\d{2}-\d{2}/) || date.to_s.match(/\d{1,2}\/\d{1,2}\/\d{4}/)
            date.to_date

            true
        rescue => e
            false
        end
    end

end