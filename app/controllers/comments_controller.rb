class CommentsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @topic = Topic.find(params[:topic_id])
    @note = Note.find(params[:note_id])
    @comment = @note.comments.create(comment_params)
    @comment.user = User.find(current_user)
    @comment.save
    redirect_to course_topic_note_path(@course, @topic, @note)
  end

  private

  def current_user
    if session[:user_id].nil?
    else
      session[:user_id]
    end
  end

  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
