class BookmarksController < ApplicationController

    def create
        @bookmark = Bookmark.new(user_id: current_user.id, lecture_id: params[:lecture_id])

        if @bookmark.save
            flash[:notice] = "ブックマークしました。"
            redirect_to lecture_path(params[:lecture_id])
        else
            flash[:alert] = "ブックマークできませんでした。"
            redirect_to lecture_path(params[:lecture_id])
        end
    end

    def destroy
        @bookmark = Bookmark.find_by(user_id: current_user.id, lecture_id: params[:lecture_id])
        
        if @bookmark.destroy
            flash[:notice] = "ブックマークを解除しました。"
            redirect_to lecture_path(params[:lecture_id])
        else
            flash[:alert] = "ブックマークを解除できませんでした。"
            redirect_to lecture_path(params[:lecture_id])
        end
    end
end
