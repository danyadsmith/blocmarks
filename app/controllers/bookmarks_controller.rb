class BookmarksController < ApplicationController

  before_action :authenticate_user!
  before_action :load_topic
  before_action :load_bookmark, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    authorize @bookmark
    @bookmark.topic_id = @topic.id
    @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to [@topic, @bookmark], notice: "Bookmark was created successfully."
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :new
    end
  end

  def edit
    authorize @bookmark
  end

  def update
    @bookmark.assign_attributes(bookmark_params)
    authorize @bookmark
    if @bookmark.save
      redirect_to [@topic, @bookmark], notice: "Bookmark was created successfully."
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :edit
    end    
  end

  def destroy
    authorize @bookmark
    if @bookmark.destroy
      redirect_to @topic, notice: "Bookmark was deleted successfully."
    else
      flash[:error] = "Error deleting bookmark. Please try again."
      render :new
    end
  end

  def favorite
    @bookmark = Bookmark.find(params[:bookmarks])
    @bookmark.favorite_for(current_user)
    redirect_to [@topic]
  end

  def unfavorite
    @bookmark = Bookmark.find(params[:bookmarks])
    @bookmark.delete_favorite_for(current_user)
    redirect_to [@topic]
  end

  private

  def load_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def load_topic
    @topic = Topic.find(params[:topic_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :url_link_text, :url_description, :topic_id, :user_id)
  end

end
