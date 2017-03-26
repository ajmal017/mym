class MessagesChannel < ApplicationCable::Channel 

  def subscribed
    stream_from "messages_#{params['market.id']}"
    stream_from "messages_user_#{current_user.id}"
  end
  
end 