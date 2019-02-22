class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]

  validates :name, presence: true, length: { minimum: 3}
  validates :dob, presence: true, format: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
  validate :chech_dob

  private
  def chech_dob
    if dob > Date.today
      errors.add(:dob, "can't birth in future")
    end
  end
end
