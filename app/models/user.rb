class User < ApplicationRecord
    before_create :generate_tmp_password!

    has_secure_password

    has_many :reservations
    
    validates :name, :username, :password, :phone_number, :ssn, presence: true
    validates :username, :ssn, uniqueness: { message: "already exists!" }

    # Assing a temp password for the user who forgot their passwords
    def generate_tmp_password!
        return password if password.present?

        new_password = random_password
        self.password = new_password
        save!
        new_password
    end

    # Generate a password that is 8 - 20 characters in length, and which contains at least one number and one special character
    def random_password
        specials = ['!', '#', '$', '@']
        numbers  = (0..9).to_a
        alpha    = ('a'..'z').to_a + ('A'..'Z').to_a
        %w[i I l L 1 O o 0].each do |ambiguous_character|
            alpha.delete ambiguous_character
        end
        characters = (alpha + specials + numbers)
        password = Random.new.rand(8..18).times.map { characters.sample }
        password << specials.sample unless password.join =~ Regexp.new(Regexp.escape(specials.join))
        password << numbers.sample  unless password.join =~ Regexp.new(Regexp.escape(numbers.join))
        password.shuffle.join
    end
end