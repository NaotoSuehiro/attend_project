class MessagesController < ApplicationController
  before_action :require_user_logged_in
  #before_action :correct_user, only: [:destroy]
  
  def create
    #@user_set=params[:message][:user_id]
    #@lecture=params[:message][:lecture_id]
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:info] = "投稿しました"
       redirect_to controller: :lectures, action: :show, id: lecture.id
    else
      flash.now[:danger] = "投稿できませんでした"
      render template: "toppages/index"
      #"lectures/show"
    end
  end

  def destroy
    @message= Message.find(params[:id])
    @message.destroy
    flash.now[:danger] = 'メッセージが削除されました'
    redirect_to controller: :lectures, action: :show, id: lecture.id
  end
  
  private
  
    def message_params
      params.require(:message).permit(:content,:user_id,:lecture_id)
    end
    
    def correct_user
    　@message = current_user.messages.find_by(id: params[:id])
    　unless @message
      　redirect_to root_url
    　end
    end
    
end
