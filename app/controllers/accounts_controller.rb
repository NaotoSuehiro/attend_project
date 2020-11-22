class AccountsController < ApplicationController
  #before_action:find_account, only: [:edit, :update]
  def new
    @account = Account.new
  end

  def create
     @account = Account.new(account_params)
    
    if @account.update(account_params)
      flash[:info] = "プロフィールを更新しました"
      #users showに飛ばしたい
      redirect_to root_path
    else
      flash.now[:danger] ="プロフィールを更新できませんでした"
      render :new
    end 
  end  

  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    
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
   params.require(:account).permit(:image, :introduction, :sns)
 end

#後からパーシャル化する
 def find_account
   @account = Account.find(params[:id])
 end
 
end
  