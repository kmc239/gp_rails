# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  description :text
#  picture     :string(255)
#  string      :string(255)
#  journal_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
