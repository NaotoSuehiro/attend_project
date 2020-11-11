class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(50)
  end

  def show
     @user = User.find(params[:id])
     #@user = User.find_by(id:params)
  end

  def new
     @user = User.new
  end

  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @user =User.none
      puts "検索した結果見つかりませんでした"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end