class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:update, :destroy]

  def create
    @post = AppPost.find(params[:app_post_id])
    @feedback = current_user.feedbacks.build(create_params)
    if !@feedback.save!
      redirect_to app_post_path(@post)
    else
      render json: { feedback: @feedback }
    end
  end

  def update
    @feedback.update!(update_params)
    render json: { feedback: @feedback }
  end

  def destroy
    @feedback.destroy!
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def create_params
      params.require(:feedback).permit(:comment).merge(user_id: current_user.id, app_post_id: params[:app_post_id])
    end

    def update_params
      params.require(:feedback).permit(:comment)
    end
end