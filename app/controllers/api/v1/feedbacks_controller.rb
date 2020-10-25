class Api::V1::FeedbacksController < ApplicationController
  
  def index
    app_post = AppPost.find(params[:postId])
    if params[:lastMessageId]
      feedbacks = app_post.feedbacks.includes(:user).where("feedbacks.id > ?", params[:lastMessageId]).references(:users)
                          .order("created_at DESC")
                          .select("feedbacks.id, comment,
                                  feedbacks.created_at, feedbacks.updated_at,
                                  user_id, users.name")
    else
      feedbacks = app_post.feedbacks.includes(:user).where(app_post_id: app_post).references(:users)
                          .order("created_at DESC")
                          .select("feedbacks.id, comment,
                                   feedbacks.created_at, feedbacks.updated_at,
                                   user_id, users.name")
    end
    render json: { feedbacks: feedbacks, currentUserId: current_user.id}
  end

end
