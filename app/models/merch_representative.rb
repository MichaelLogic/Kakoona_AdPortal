class MerchRepresentative < ActiveRecord::Base 
  belongs_to :merchant
  validates :merchant_id, presence: true

  before_save { self.email = email.downcase }

  before_create :create_remember_token
  validates :first_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  #Nested Avatar
  has_one :avatar_grffk, inverse_of: :merch_representative
  accepts_nested_attributes_for :avatar_grffk, allow_destroy: true

  #Ad Campaigns
  has_many :ad_campaigns

  #def avatar_for_form
    #avi = avatar_grffk.where(merch_representative_id: id)
    #avi.any? ? avi : avatar_grffk.build
  #end

  def MerchRepresentative.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def MerchRepresentative.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


  private

    def create_remember_token
      self.remember_token = MerchRepresentative.digest(MerchRepresentative.new_remember_token)
    end
end
