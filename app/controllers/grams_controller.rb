class GramsController < ApplicationController
  before_action :authenticate_user!
  # , :set_post, only: [:show, :edit, :update]

  def index
    @grams = Gram.order('created_at DESC')
  end

  def show
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(post_params)
    if @gram.save
      redirect_to grams_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gram.update_attributes(post_params)
      redirect_to post_path(@gram)
    else
      render :edit
    end
  end

  def users_grams
  end 

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def set_post
    @gram = Gram.find(params[:id])
  end
end