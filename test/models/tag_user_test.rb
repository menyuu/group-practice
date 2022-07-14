# == Schema Information
#
# Table name: tag_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_tag_users_on_tag_id   (tag_id)
#  index_tag_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  tag_id   (tag_id => tags.id)
#  user_id  (user_id => users.id)
#
require "test_helper"

class TagUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
