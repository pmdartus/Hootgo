class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns, dependent: :destroy
  has_many :authorizations, dependent: :destroy

  # Initialize account after creation
  before_create :initialize_account

  private

  ## initilize_account
  # Set credit to 0 after the creation of an account
  def initialize_account
    self.credits = 0
  end

  def email_required?
    super && provider.blank?
  end
end
