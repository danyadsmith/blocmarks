class IncomingController < ApplicationController

  def create
    puts params.inspect
    #params['sender']
    # user = User.where(email: params['sender']).first
    # unless user, create topic, bookmark
    #params[:subject]
    #params['body-plain'] or params["stripped-text"]
  end
end
