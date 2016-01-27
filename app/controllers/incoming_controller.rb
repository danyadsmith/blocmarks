class IncomingController < ApplicationController

  def create
    puts params.inspect

    # Get Bookmark Data from Email Message
    user = User.where(email: params['sender']).first
    topic = Topic.where(topic: params['Subject']).first
    bookmark_data = params["stripped-text"].split("\r\n")
    
    bookmark_link_text = bookmark_data[0] 
    bookmark_url = bookmark_data[1] 
    bookmark_description = bookmark_data[2] 

    new_bookmark = Bookmark.new
    new_bookmark.topic_id = topic.id 
    new_bookmark.url = bookmark_url
    new_bookmark.url_link_text = bookmark_link_text
    new_bookmark.description = bookmark_description
    new_bookmark.save


  end
end
