class ChangeVideoLengthToFloat < ActiveRecord::Migration
  def change
  	change_column :kakoona_videos, :length, :float
  end
end
