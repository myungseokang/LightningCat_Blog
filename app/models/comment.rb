class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  resourcify
  include Authority::Abilities
end
