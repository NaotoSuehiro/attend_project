class AccountsController < ApplicationController
  
  def new
    #"もしAccountテーブルにインスタンスがない（nul）ならインスタンスを作成。インスタンスがあるならそれを見つける条件式を書く"
    @account = Account.new
    unless
    @account = Account.find(params[:id])
    end
  end

  def create
    @account = Account.find(params[:id])
    
    if @account.update(account_params)
      flash[:info] = "プロフィールを更新しました"
      redirect_to @user
    else
      flash.now[:danger] ="プロフィールを更新できませんでした"
      render "user/show"
    end 
  end
  
end

private
 
 def account_params
   params.require(:account).permit(:image, :introduciton, :sns)
 end

#後からパーシャル化する
 def set_account
  @account = Account.find(params[:id])
 end
  