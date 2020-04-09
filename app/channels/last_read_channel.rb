class LastReadChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
    stop_all_streams
  end

  def receive(data)
    chatroom_user = current_user.chatroom_users.find_by(chatroom_id: data["chatroom_id"])
    chatroom_user.update(last_read_at: Time.zone.now)
  end
end
