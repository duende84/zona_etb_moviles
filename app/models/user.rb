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

class User < ActiveRecord::Base

  # -- associations --
  has_one :code, foreign_key: 'id'

  # -- validations --
  validates :name           , presence: true
  validates :identification , presence: true, uniqueness: { case_sensitive: false }
  validates :phone          , presence: true, uniqueness: { case_sensitive: false }
  validates :code_id        , presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
