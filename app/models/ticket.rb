class Ticket < ApplicationRecord
    after_create :generate_code

    def generate_code
        self.code = SecureRandom.hex
        save
    end
end
