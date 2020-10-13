class PostingController < ApplicationController
 def new
     @lecture = Lecture.find(paramas[:id])
 end
 
 
def create
end

def edit
end

def destroy
end

end
