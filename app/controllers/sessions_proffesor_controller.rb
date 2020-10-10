class SessionsProffesorController < ApplicationController
  def new
  end

  def create
   email = paramas [:session][:emai].dawncase
   passward = paramas [:session][passward]
    if  login(email,passward)
      flash[:succese] = "ログインできました"
      　redirect_to @user #後でURLは変更
    eles
      flash.now[:danger] = "ログインできませんでした"
    end
  end

  def destroy
    session[:professor_id] = nil
      flash[:success] = "ログアウトしました"
    redirect_to root_url
  end

private
  def login 
  @professor=Profssor.find_by(email:emai) 
    if @professor && @professor.authenticate(password)
      session[:professor_id] = @professor.id
      return true
    else
      return false
    end
  end
end
