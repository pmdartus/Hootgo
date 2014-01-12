class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :campaigns, dependent: :destroy
  has_many :authorizations, dependent: :destroy
  has_many :pages, through: :authorizations

  before_create :initialize_account
  validate :positive_credits

  def self.create_with_oauth(auth)
    create(name:auth.info.name, password: Devise.friendly_token[0,20])
  end

  ## get_credits
  # Return the available credits in usd
  def get_credits
    credit_string = self.credits.to_s
    until credit_string.length > 2
      credit_string.insert(0, '0')
    end
    credit_string .insert(-3, '.')
  end

  private

  ## initilize_account
  # Set credit to 0 after the creation of an account
  def initialize_account
    self.credits = 0
  end

  ## positive_credits
  # Add an error if the balance is negative
  def positive_credits
    errors.add(:credits, "Not enough credits") if self.credits and self.credits < 0
  end

  def email_required?
    false
  end
end
