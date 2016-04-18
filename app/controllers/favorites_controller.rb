class FavoritesController < ApplicationController
  def index
    unless current_user
      flash[:error] = "Please sign in."
      redirect_to new_session_path
    else
      @favorites = Favorite.where(user: current_user)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy!
      flash[:notice] = "#{@favorite.kid.name} removed from your favorite name list."
      redirect_to user_favorites_path(current_user)
    end
  end
end
