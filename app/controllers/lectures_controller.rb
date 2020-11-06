class LecturesController < ApplicationController
  
  def index
      @lectures = Lecture.all
  end

  def show
      @lecture = Lecture.find(params[:id])
      #messageの表記
      @message = current_user.messages.build
      @messages = current_user.messages.order(id: :desc).page(params[:page])
  end

  def new
      @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:succece]="クラスが作成されました"
      redirect_to @lecture #lecture_url(@lecture)
    else
      flash.now[:danger]="クラスが作成できませんでした"
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
      
  end

  def update
      @lecture = Lecture.find(params[:id])
    if @lecture.save
        flash[:succece] = "クラスが更新されました"
        redirect_to @lecture
    else
     flash.now[:danger] = "クラスが更新できませんでした"
     　render :edit
    end
      
  end

  def destroy
      @lecture=Lecture.find(params[:id])
      @lecture.destroy
      flash[:succece]="クラスが削除されました"
      redirect_to lectures_url
  end
  
  private
    def lecture_params
      params.require(:lecture).permit(:name,:room,:comment)
        
    end

end
