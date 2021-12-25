class Game < ApplicationRecord
  belongs_to :user


  validates :title, presence: true
  validates :genre, presence: true
  validates :detail, presence: true
end
