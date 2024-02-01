class HelpMessagesController < ApplicationController
  def new
    @help_message = HelpMessage.new
  end

  def create
    @help_message = HelpMessage.new(help_message_params)

    if @help_message.save
      flash[:success] = 'Help message sent successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def help_message_params
    params.require(:help_message).permit(:user_id, :email, :message)
  end
end
