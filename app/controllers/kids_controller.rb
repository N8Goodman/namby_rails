class KidsController < ApplicationController
  def index
    @gender_collection = Result::GENDER
    @letter_collection = Result::ALPHABET
    @count_collection = Result::COUNTER
    @search = Result.new
  end

  def update
    if current_user
      @result = Result.find(params[:result_id])
      @user = current_user
      @kid = Kid.find(params[:id])
      @favorite = Favorite.new(user: @user, kid: @kid )
      if @favorite.save
        flash[:notice] = "#{@favorite.kid.name} has been added to your list of favorite names."
        redirect_to edit_result_path(@result)
      end
    end
  end
end
