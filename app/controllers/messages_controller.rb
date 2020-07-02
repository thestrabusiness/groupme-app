class MessagesController < ApplicationController
  before_action :require_login

  def index
    if current_user.member?(params[:group_id])
      render json: Message.where(group_id: params[:group_id]).limit(20)
    else
      head :unauthorized
    end
  end
end
