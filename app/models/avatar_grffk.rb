class AvatarGrffk < ActiveRecord::Base
	validates :merch_representative, :presence => true
	belongs_to :merch_representative, inverse_of: :avatar_grffk

	has_attached_file :grffk, 
					  :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :grffk, :content_type => /\Aimage\/.*\Z/

  	process_in_background :grffk, processing_image_url: "/images/processing.gif"

end
