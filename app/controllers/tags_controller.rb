class TagsController < ApplicationController
  def index
    @tags = Tag.all
    if params[:search]
      @tags = Tag.search(params[:search]).order("created_at DESC")
    else
      @tags = Tag.all.order('created_at DESC')
    end
  end



  def show
    @tag = get_tag
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render 'new'
    end
  end

  def edit
    @tag = get_tag
  end

  def destroy
    @tag = get_tag
    @tag.destroy
    redirect_to tags_path
  end

private

  # for great safety!
  def tag_params
    params.require(:tag).permit(:name)
  end

  def get_tag
    Tag.find(params[:id])
  end
end
