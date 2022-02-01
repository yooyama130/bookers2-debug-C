class Group < ApplicationRecord
  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
end
