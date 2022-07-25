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

  def sameHasTag?(user)
    tags.any? { |i| user.tags.include?(i) }
  end

end


# group_tags = self.group_tags
#     user_tags = user.tag_users
#     group_tags.each do |group_tag|
#       user_tags.all? { |user_tag| user_tag.tag.name == group_tag.tag.name }
#     end