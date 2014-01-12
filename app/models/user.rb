class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :campaigns, dependent: :destroy
  has_many :authorizations, dependent: :destroy
  has_many :pages, through: :authorizations

  # Initialize account after creation
  before_create :initialize_account

  def self.create_with_oauth(auth)
    create!(name:auth.info.name, password: Devise.friendly_token[0,20])
  end

  private

  ## initilize_account
  # Set credit to 0 after the creation of an account
  def initialize_account
    self.credits = 0
  end

  def email_required?
    false
  end
end
