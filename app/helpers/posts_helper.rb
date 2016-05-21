module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def post_category(post)
    post.try(:category).try(:name) || "Uncategorized"
    # 또는 post&.category&.name || "Uncategorized" (루비 2.3.0+)
  end

end
