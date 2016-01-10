class TopicsController < ApplicationController

  before_action :load_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to @topic, notice: "Topic was created successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path, notice: "Topic was deleted successfully"
    else
      flash[:error] = "Error deleting topic. Please try again."
      render :index
    end
  end

  private

  def load_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end
end
