# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  identification :string           not null
#  email          :string           not null
#  phone          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  code_id        :integer          not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
