class Game < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  validates :title, presence: true
  validates :genre, presence: true
  validates :detail, presence: true
end
