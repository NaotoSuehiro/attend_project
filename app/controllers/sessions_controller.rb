class SessionsController < ApplicationController
  def new
  end

    def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:info] = 'ログインに成功しました。'
      redirect_to users_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
    end

  def destroy
      session[:user_id] = nil
    flash[:info] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
  
end


