class MessagesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @lecture = Lecture.find(params[:id])
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:info] = "投稿しました"
      redirect_to @lecture
    else
      flash[:danger] = "投稿できませんでした"
      #不明
    　redirect_to @lecture
    end
  end

  def destroy
    @message.destroy
    flash.now[:danger] = 'メッセージが削除されました'
    redirect_to @lecture
  end
  
  private
  
    def message_params
      params.require(:message).permit(:content)
    end
    
    def correct_user
    　@message = current_user.messages.find_by(id: params[:id])
    　unless @message
      　redirect_to root_url
    　end
    end
    
end
