class Post < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  include SearchCop

  acts_as_taggable

  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :published_posts, -> { where( published: true ).order( created_at: :desc ) }
  scope :myposts, -> (user) { where( user_id: user.id ).order( created_at: :desc ) }
  scope :recent, -> { published_posts.limit(10) }
  scope :uncategorized_posts, -> { published_posts.where(category_id: nil) }

  search_scope :search do
    attributes :title, :content
    attributes :comment => "comments.body"
  end

  def tag_list
    self.tags.map(&:name).join(', ')
  end

end
