# == Schema Information
#
# Table name: books
#
#  id                :integer          not null, primary key
#  author_id         :integer
#  genre_id          :integer
#  title             :string
#  description       :text
#  cover_art         :string
#  cover_art_base_64 :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  year              :string
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
