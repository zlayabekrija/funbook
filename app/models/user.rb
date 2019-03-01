class User < ApplicationRecord
  has_one_attached :profile_pic
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy
  has_many :friends, dependent: :destroy # to do
  has_many :reactions, through: :posts, dependent: :destroy
  has_many :reactions, through: :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  validates :name, presence: true, length: { minimum: 3}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]
  validates :dob, presence: true, format: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/, unless: -> { from_omniauth? }
  validate :check_dob, unless: -> { from_omniauth? }
  



  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.first_name
      user.password = Devise.friendly_token[0,20]
    end
  end

  protected
  def check_dob
    if dob
      errors.add(:dob, "can't be in future") if dob > Date.today
    end
  end

  private
  def from_omniauth?
    provider && uid
  end
end
