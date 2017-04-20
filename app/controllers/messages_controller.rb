class MessagesController < ApplicationController
	before_action :find_message, only: [:edit, :update, :show, :delete]

	# Index action to render all messages
	def index
		@messages = Message.where(subject: current_user.email)
	end

	# New action for creating message
	def new
		@message = Message.new
	end

	# Create action saves the message into database
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
	
	# Edit action retrives the message and renders the edit page
	def edit
	end

	# Update action updates the message with the new information
	def update
		if @messages.update_attributes(message_params)
			flash[:notice] = "Successfully updated message!"
			redirect_to message_path(@messages)
		else
			flash[:alert] = "Error updating message!"
			render :edit
		end
	end

	# The show action renders the individual message after retrieving the the id
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
		params.require(:message).permit(:title, :subject, :content)
	end

	def find_message
		@message = Message.find(params[:id])
	end
end
