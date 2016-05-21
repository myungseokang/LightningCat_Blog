class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :dynamic_layout

  before_action :tag_cloud

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action!'
  end

  private

  def dynamic_layout
    devise_controller? ? 'devise_layout' : 'general_layout'
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
end
