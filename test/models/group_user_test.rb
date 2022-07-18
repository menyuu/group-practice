# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  owner_id   :integer          not null
#
# Indexes
#
#  index_group_users_on_group_id  (group_id)
#  index_group_users_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#  owner_id  (owner_id => owners.id)
#
require "test_helper"

class GroupUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end