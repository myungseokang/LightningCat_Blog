class Category < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :nullify

  resourcify
  include Authority::Abilities
end
