class Institute < ApplicationRecord
  has_many :place
  has_many :section
  has_many :user
end

