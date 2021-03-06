class ResultsController < ApplicationController
  def index
    unless current_user
      flash[:error] = "Please register or sign in."
      redirect_to sessions_path
    else
      @results = Result.where(user: current_user)
    end
  end

  def new
    unless current_user
      flash[:error] = "Please register or sign in."
      redirect_to sessions_path
    else
      @gender_collection = Result::GENDER
      @letter_collection = Result::ALPHABET
      @count_collection = Result::COUNTER
      @search = Result.new
    end
  end

  def edit
    unless current_user
      flash[:error] = "Please register or sign in."
      redirect_to sessions_path
    else
      @result = Result.find(params[:id])
      @gender_collection = Result::GENDER
      @letter_collection = Result::ALPHABET
      @count_collection = Result::COUNTER
      @search = Result.find(params[:id])
      @bad = Bad.new
      @bads = @result.bads.map {|bad| bad.name}
      @results = matches
    end
  end

  def create
    unless current_user
      flash[:error] = "Please register or sign in."
      redirect_to sessions_path
    else
      @result = Result.new(result_params)
      @result.user = current_user
      if @result.save
        redirect_to edit_result_path(@result)
      end
    end
  end

  def update
    unless current_user
      flash[:error] = "Please register or sign in."
      redirect_to sessions_path
    else
      @result = Result.find(params[:id])
      @result.update(result_params)
      if @result.save
        redirect_to edit_result_path(@result)
      end
    end
  end

  def destroy
    @result = Result.find(params[:id])
    if @result.destroy!
      flash[:notice] = "Your saved search has been removed."
      redirect_to results_path(current_user)
    end
  end

  private
    def result_params
      params.require(:result).permit(
      :name,
      :count,
      :gender,
      :starts_with,
      :ends_with,
      )
    end

    def matches
      if @result.starts_with != '*' && @result.ends_with != '*'
        Kid.where(first_letter: @result.starts_with, last_letter: @result.ends_with, gender: @result.gender).where.not(name: @bads).order("RANDOM()").limit(@result.count)
      elsif @result.starts_with == '*' && @result.ends_with == '*'
        Kid.where(gender: @result.gender).where.not(name: @bads).order("RANDOM()").limit(@result.count)
      elsif @result.starts_with == '*' && @result.ends_with != '*'
        Kid.where(last_letter: @result.ends_with, gender: @result.gender).where.not(name: @bads).order("RANDOM()").limit(@result.count)
      elsif @result.starts_with != '*' && @result.ends_with == '*'
        Kid.where(first_letter: @result.starts_with, gender: @result.gender).where.not(name: @bads).order("RANDOM()").limit(@result.count)
      end
    end

end
