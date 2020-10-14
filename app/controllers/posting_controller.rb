class PostingController < ApplicationController
 
 def show
  @lecture = Lecture.find(params[:id])
 end
 
 def new
     @lecture = Lecture.find(params[:id])
     @lecture =  Lecture.new
 end
 
 
def create
    @lecture =  Lecture.new
     if @lecture.save
      flash[:success] = '講義が正常に投稿されました'
      redirect_to lectures_path
     else
      flash.now[:danger] = '講義が投稿されませんでした'
      render lectures_path
     end
end
    
    


 def edit
 end

 def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    flash[:success] = '講義は正常に削除されました'
    redirect_to  lectures_path
 end

end
