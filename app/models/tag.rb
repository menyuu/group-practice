# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :tag_users
  has_many :users, through: :tag_users
  has_many :group_tags, dependent: :destroy
  has_many :groups, through: :group_tags, source: :group

end
