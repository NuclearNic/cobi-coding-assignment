if @book.present?
	json.extract! @book, :id, :title, :description, :genre_name, :author_name, :cover_art_base_64
else
  json.response do
    json.code 404
  end
end
