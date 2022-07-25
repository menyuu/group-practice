# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  user_id    :integer
#
# Indexes
#
#  index_group_users_on_group_id  (group_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#
class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
