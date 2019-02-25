class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy
  has_many :friends, dependent: :destroy # to do
  has_many :reactions, through: :posts, dependent: :destroy
  has_many :reactions, through: :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]

  validates :name, presence: true, length: { minimum: 3}
  validates :dob, presence: true, format: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
  validate :check_dob

  protected
  def check_dob
    errors.add(:dob, "can't birth in future") if dob > Date.today
  end
end
