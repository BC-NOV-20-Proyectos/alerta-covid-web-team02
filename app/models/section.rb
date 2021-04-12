class Section < ApplicationRecord
  belongs_to :institute
  has_many :user
end
