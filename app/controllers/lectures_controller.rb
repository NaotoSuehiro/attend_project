class LecturesController < ApplicationController
  #共通化
  #before_action:find_lecture, only: [:show, :edit, :update, :destroy]
  
  def index
    @lectures = Lecture.all.page(params[:page])
  end

  def show
    @lecture = Lecture.find(params[:id])
    @message_index =Message.where(lecture_id:@lecture.id).order(id: :asc).page(params[:page]).per(50)
    @bookmark = Bookmark.where(lecture_id: @lecture.id)
    if logged_in?
      @message = current_user.messages.build
    end
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:info] = 'クラスが作成されました'
      redirect_to @lecture #lecture_url(@lecture)
    else
      flash.now[:danger] = 'クラスが作成できませんでした'
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update(lecture_params)
      flash[:info] = "クラスが更新されました"
      redirect_to @lecture
    else
      flash.now[:danger] = 'クラスが更新できませんでした'
      render :edit
    end
  end

  def destroy
    @lecture=Lecture.find(params[:id]) 
    @lecture.destroy
    flash[:danger]="クラスが削除されました"
    redirect_to lectures_url
  end
  
  private
  
  def lecture_params
    params.require(:lecture).permit(:name,:room,:comment,:user_id)
  end
    
  def find_lecture
    @lecture = Lecture.find(params[:id])
  end
    
end
