class CommentsController < ApplicationController
before_action :find_commentable

    def new
      @comment = @commentable.comments.new
    end

    def create
      @comment = @commentable.comments.new comment_params

      if @comment.save
        redirect_to @commentable, notice: 'Your comment was successfully posted!'
      else
        render :new, notice: "Your comment wasn't posted!"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end

    def find_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

end