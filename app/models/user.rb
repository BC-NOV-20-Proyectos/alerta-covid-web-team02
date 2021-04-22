class User < ApplicationRecord
  belongs_to :institute
  belongs_to :section
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable,  :database_authenticatable,
  #        :jwt_authenticatable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: self
  #self.skip_session_storage = [:http_auth, :params_auth]
  # def generate_jwt
  #   JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  # end
  def jwt_payload
    super.merge('id' => self.id)
  end
end
