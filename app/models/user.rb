class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friend_request, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friend_invites, class_name: "FriendRequest", foreign_key: :friend_id, dependent: :destroy
  has_many :frienders, through: :friend_invites, source: :user

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy

  validates :name, presence: :true

  def feed
    Post.where("user_id = ?", id)
  end
end
