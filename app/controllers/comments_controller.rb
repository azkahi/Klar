class CommentsController < ApplicationController
	def create

		# Get Article comment is attached to
		@article = Article.find(params[:article_id])
    		
    	# Create and save comment
    	@comment = @article.comments.new(comment_params)

    	if @comment.save
    		flash[:notice] = "Successfully created comment!"
			redirect_to article_path(@article)
		else
			flash[:notice] = "Error creating new comment!"
			redirect_to article_path(@article)
		end
    end

    private
    	
    	def comment_params
    		params.require(:comment).permit(:writer_name, :content)
    	end
    
end
