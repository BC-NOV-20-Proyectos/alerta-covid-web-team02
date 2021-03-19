class Place < ApplicationRecord
  belongs_to :institute
  #after_create :generate_code
end
