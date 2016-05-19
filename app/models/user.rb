class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities

  has_many :categories, dependent: :nullify
  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  def confirm
    super
    add_role :user
  end
end
