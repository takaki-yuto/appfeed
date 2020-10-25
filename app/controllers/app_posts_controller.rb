class AppPostsController < ApplicationController
  before_action :set_post, except: [:new, :create]

  def new
    @post = AppPost.new
  end
  
  def create
    @post = current_user.app_posts.new(post_params)
    if @post.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post_user = User.find(@post.user_id)
    @feedbacks = @post.feedbacks.includes(:app_post).order("created_at DESC")
    @feedback = Feedback.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post
      redirect_to app_post_path(@post)
    else
      render action: :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path
  end

  private
    def set_post
      @post = AppPost.find(params[:id])
    end
    
    def post_params
      params.require(
        :app_post
      ).permit(
        :name, :dev_environment, :using_language,
        :using_lib_fram, :using_other, :detail, 
        :background, :dev_period
      ).merge(user_id: current_user.id)
    end
end
