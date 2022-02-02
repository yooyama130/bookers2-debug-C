class Group < ApplicationRecord
  attachment :image

# グループとのアソシエーション
 has_many :group_users , foreign_key: "group_id", dependent: :destroy
 has_many :users, through: :group_users, source: :user

  validates :name, presence: true
  validates :introduction, presence: true
end
