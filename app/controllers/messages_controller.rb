class MessagesController < ApplicationController
	before_action :find_article, only: [:edit, :update, :show, :delete]

	def new
		@messages = Message.new
	end

	def all
		@messages = Message.all
	end

	def create
		@message = current_user.messages.new(message_params)
		if @message.save
			flash[:notice] = "Successfully created message!"
			redirect_to message_path(@message)
		else
			flash[:alert] = "Error creating new message!"
			render :new
		end
	end

	def edit
		
	end

	def show
		
	end

	def destroy
		if @messages.destroy
			flash[:notice] = "Successfully deleted message!"
			redirect_to messages_path
		else
			flash[:alert] = "Error updating message!"
		end
	end

	private

	def message_params
		params.require(:message).permit(:to, :title)
	end

	def find_message
		@message = Message.find(params[:id])
	end

end
