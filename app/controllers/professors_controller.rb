class ProfessorsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor=Professor.new(professor_params)
    
    if @profssor.save
      flash[:succes]= 'ユーザを登録しました。'
      redirect_to @professor
     else
      flash.now[:denger]= 'ユーザの登録に失敗しました。'
      render:new
    end
  end

 def professor_params
    params.require(:profssor).permit(:name, :email, :password, :password_confirmation)
 end
 
end
