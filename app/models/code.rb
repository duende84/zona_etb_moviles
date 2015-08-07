# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Code < ActiveRecord::Base

  # -- validations --
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
