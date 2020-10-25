class MessagesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @message = curent_user.messages.build(meesage_params)
    if @message.save
      flash[:succece] = "投稿しました"
      redirect_to @lecture
    else
      flash[:danger] = "投稿できませんでした"
    　render 'lecture/index'
    end
  end

  def destroy
    @message.destroy
    flash.now [:danger] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
    def meesage_params
    params.require(:message).permit(:content)
    end
  
    def correct_user
    @message = current_user.messages.find_by(id: params[:id])
    unless @message
      redirect_to root_url
    end
    end
end
