class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :protect_from_forgery, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    puts params.inspect

    puts "--- Get User and Topic from Incoming Email ---"
    user = User.where(email: params["sender"]).first

    if user.present?
      puts "User: #{user.inspect}"
      topic = Topic.where(topic: params["Subject"]).first
      puts "Topic: #{topic.inspect}"

      unless topic.present?
        puts "--- Creating New Topic ---"
        new_topic = Topic.new
        new_topic.user_id = user.id
        new_topic.title = params["Subject"]
        new_topic.save
      end

      puts "--- Attempting to Create New Bookmark ---"
      bookmark_data = params["stripped-text"].split("\r\n")
      puts "Bookmark Data: #{bookmark_data.inspect}"
      bookmark_link_text = bookmark_data[0] 
      bookmark_url = bookmark_data[1] 
      bookmark_description = bookmark_data[2] 

      new_bookmark = Bookmark.new
      new_bookmark.topic_id = topic.id 
      new_bookmark.url = bookmark_url
      new_bookmark.url_link_text = bookmark_link_text
      new_bookmark.description = bookmark_description
      new_bookmark.save
      puts "New Bookmark: #{new_bookmark.inspect}"
    end

    head 200
  end
end
