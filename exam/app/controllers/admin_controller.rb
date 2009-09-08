class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        flash[:notice] = "登录成功"
        render :action=> 'login'
      else
        flash[:notice] = "登录失败"
        render :action=> 'login'
      end
    end
  end

  def logout
  end

end
