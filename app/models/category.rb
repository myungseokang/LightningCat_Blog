class Category < ActiveRecord::Base4
  belongs_to :user
  has_many :posts, dependent: :nullify

  resourcify
  include Authority::Abilities
end
