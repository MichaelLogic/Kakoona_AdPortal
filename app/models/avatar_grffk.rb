# == Schema Information
#
# Table name: documents
#
#  id                  :integer          not null, primary key
#  direct_upload_url   :string(255)      not null
#  upload_file_name    :string(255)
#  upload_content_type :string(255)
#  upload_file_size    :integer
#  upload_updated_at   :datetime
#  processed           :boolean          default(FALSE), not null
#  created_at          :datetime
#  updated_at          :datetime
#

class AvatarGrffk < ActiveRecord::Base

	validates :merch_representative, :presence => true
	belongs_to :merch_representative, inverse_of: :avatar_grffk

end
