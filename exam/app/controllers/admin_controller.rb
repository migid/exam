class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user] = user
        redirect_to :controller=>:users
      else
        flash[:notice] = I18n.t("login_error")
        render :action=> 'login'
      end
    end
  end

  def logout
  end

end
