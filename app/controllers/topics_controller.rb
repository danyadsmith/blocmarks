class TopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :load_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to @topic, notice: "Topic was created successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    authorize @topic
  end

  def update
    @topic.assign_attributes(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was updated successfully"
    else
      flash[:error] = "Error updating topic. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @topic
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
