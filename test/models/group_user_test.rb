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
require "test_helper"

class GroupUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
