class AdCampaign < ActiveRecord::Base
  belongs_to :merch_representative

  #Nested Brand Grffk
  has_one :campaign_brand_grffk, inverse_of: :ad_campaign
  accepts_nested_attributes_for :campaign_brand_grffk, allow_destroy: true

  #Nested Preload Grffk
  has_one :campaign_preload_grffk, inverse_of: :ad_campaign
  accepts_nested_attributes_for :campaign_preload_grffk, allow_destroy: true

  #Nested Kakoona Video
  has_one :kakoona_video, inverse_of: :ad_campaign
  accepts_nested_attributes_for :kakoona_video, allow_destroy: true

  #Nested Product
  has_one :product, inverse_of: :ad_campaign
  accepts_nested_attributes_for :product, allow_destroy: true
  

  def start_date=(date)   
    begin   
      parsed = Date.strptime(date,'%m/%d/%Y %I:%M %p')    
      super parsed    
    rescue    
      date            
    end   
  end    

  def end_date=(date)    
    begin   
      parsed = Date.strptime(date,'%m/%d/%Y %I:%M %p')    
      super parsed    
    rescue    
      date            
    end   
  end
  
end
