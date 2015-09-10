class DashboardController < ApplicationController
  before_action :signed_in_user
  after_action :work_workers
  def home
  	#Delayed::Worker.new.work_off
  end

  def about
  end

  def future
  end

  def contact
  end

  protected
  
  def work_workers
  	Delayed::Worker.new.work_off
  end

end
