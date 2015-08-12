class Product < ActiveRecord::Base
  belongs_to :ad_campaign, inverse_of: :product

  has_attached_file :grffk, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :grffk, :content_type => /\Aimage\/.*\Z/

  after_initialize :init
 
  private
    def init
      if self.new_record? && self.product_type.nil?
        self.product_type = 1
      end
    end

end
