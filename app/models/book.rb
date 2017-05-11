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
#

class Book < ApplicationRecord
	belongs_to :author
	belongs_to :genre
end
