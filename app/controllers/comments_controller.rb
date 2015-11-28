class CommentsController < ApplicationController
  before_action :get_presentation

  def index
    @comments = @presentation.comments.order('created_at asc')

    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @presentation.comments.build(comment_params)
    @comment.user_id = current_user.id

    @comment.save
    render layout: false
         
    # if @comment.save
      # respond_to do |format|
        # format.html { redirect_to root_path }
        # format.js
      # end
    # else
    #   flash[:alert] = 'Check the comment form, something went wrong.'
    #   render root_path
    # end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :presentation_id)
  end

  def get_presentation
    @presentation = Presentation.find(params[:presentation_id])
  end

end
