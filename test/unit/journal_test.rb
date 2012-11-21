# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  gender     :string(255)
#  birthdate  :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class JournalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
