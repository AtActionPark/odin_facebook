class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy

   validates :user_id, presence: true
   validates :content, presence: true
end
