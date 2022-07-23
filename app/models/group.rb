# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  has_many :group_tags, dependent: :destroy
  has_many :tags, through: :group_tags

  def includeUser?(user)
    group_users.exists?(user_id: user.id)
  end

end
