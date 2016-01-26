class BookmarksController < ApplicationController

  before_action :load_topic
  before_action :load_bookmark, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic_id = @topic.id
    if @bookmark.save
      redirect_to [@topic, @bookmark], notice: "Bookmark was created successfully."
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @bookmark.assign_attributes(bookmark_params)
    if @bookmark.save
      redirect_to [@topic, @bookmark], notice: "Bookmark was created successfully."
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :edit
    end    
  end

  def destroy
    if @bookmark.destroy
      redirect_to @topic, notice: "Bookmark was deleted successfully."
    else
      flash[:error] = "Error deleting bookmark. Please try again."
      render :new
    end
  end

  private

  def load_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def load_topic
    @topic = Topic.find(params[:topic_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :url_link_text, :url_description, :topic_id)
  end

end
