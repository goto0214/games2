class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :followers,
  class_name: 'Relationship',
  foreign_key: 'follower_id',
  dependent: :destroy,
  inverse_of: :follower

  has_many :followings,
  class_name: 'Relationship',
  foreign_key: 'following_id',
  dependent: :destroy,
  inverse_of: :following

  has_many :following_users, through: :followers, source: :following
  has_many :follower_users, through: :followings, source: :follower

  attachment :profile_image

  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }
end
