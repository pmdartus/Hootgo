class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

  has_many :campaigns, dependent: :destroy

  # Initialize account after creation
  before_create :initialize_account

  ## find_for_facebook_oauth(auth, signed_in_ressource)
  # Create and/or return the signed in user, with a random password
  # param auth : facebook informations and credentials
  # param signed_in_ressource : not used now
  # return connected user
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
    end
    user
  end

  ## get_credits
  # Return the available credits in usd
  def get_credits
    self.credits.to_s.insert(-3, '.')
  end

  private

  ## initilize_account
  # Set credit to 0 after the creation of an account
  def initialize_account
    self.credits = 0
  end
end
