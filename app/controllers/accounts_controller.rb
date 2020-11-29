class AccountsController < ApplicationController
  
  def new
    @account = Account.new
  end

  def create
    params[:account][:user_id] = current_user.id
    @account = Account.new(account_params)
    if @account.save
      flash[:info] = "プロフィールを更新しました"
      redirect_to controller: :users, action: :show, id: current_user.id
    else
      flash.now[:danger] ="プロフィールを更新できませんでした"
      render :new
    end 
  end  

  
  def edit
    @account = Account.find_by(user_id:current_user.id)
  end
  
  def update
    @account = Account.find_by(user_id:current_user.id)
    if @account.update(account_params)
      flash[:info] = 'プロフィールは更新されました'
      redirect_to controller: :users, action: :show, id: current_user.id
    else
      flash.now[:danger] = 'プロフィールはは更新されませんでした'
      render :edit
    end
  end
  

 private
 
 def account_params
   params.require(:account).permit(:image, :introduction, :sns, :user_id)
 end

end
  