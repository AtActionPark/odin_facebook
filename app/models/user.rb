class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friend_requests, dependent: :destroy
  has_many :invitees, through: :friend_requests, source: :friend

  has_many :friend_invites, class_name: "FriendRequest", foreign_key: :friend_id, dependent: :destroy
  has_many :inviters, through: :friend_invites, source: :user

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: :true

  def feed
    Post.where("user_id IN (:friend_ids) OR user_id = :user_id",
      friend_ids: friend_ids, user_id: id)
  end

  def add_friend other_user
    friendships.create(friend_id: other_user.id)
    other_user.friendships.create(friend_id: self.id)
  end

  def remove_friend other_user

  end

  def friend? other_user
    friends.include?(other_user)
  end

  def invite other_user
    friend_requests.create(friend_id: other_user.id)
    other_user.friend_invites.create(friend_id: self.id)
  end

  def accept_invite invite
    other_user = User.find(invite.user_id)
    add_friend other_user
    invite.destroy
  end
end
