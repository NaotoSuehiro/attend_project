class AccountsController < ApplicationController
  #before_action:find_account, only: [:edit, :update]
  def new
    @account = Account.new
  end

  def create
    params[:account][:user_id] = current_user.id
    @account = Account.new(account_params)
    #binding.pry
    if @account.save
      flash[:info] = "プロフィールを更新しました"
      #users showに飛ばしたい
      redirect_to root_path
    else
      flash.now[:danger] ="プロフィールを更新できませんでした"
      render :new
    end 
  end  

  
  def edit
    @user =User.find(params[:id])
    @account = Account.find_by(user_id:@user.id)
  end
  
  def update
    @user =User.find(params[:id])
    @account = Account.find_by(user_id:@user.id)
    
    if @account.update(account_params)
      flash[:info] = 'プロフィールは更新されました'
      #users showに飛ばしたい
      redirect_to root_path
    else
      flash.now[:danger] = 'プロフィールはは更新されませんでした'
      render :edit
    end
  end
  

 private
 
 def account_params
   params.require(:account).permit(:image, :introduction, :sns, :user_id)
 end

#後からパーシャル化する
 def find_account
   @account = Account.find(params[:id])
 end
 
end
  