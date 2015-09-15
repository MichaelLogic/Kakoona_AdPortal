class SessionsController < ApplicationController
  def new

  end

  def create
    rep = MerchRepresentative.find_by(email: params[:session][:email].downcase)
    if rep && rep.authenticate(params[:session][:password])
      sign_in rep
      redirect_back_or root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      redirect_to login_path, notice: 'Invalid email/password combination'
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
