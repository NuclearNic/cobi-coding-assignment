if @book.present?
	json.extract! @book, :id, :title, :author, :description
else
  json.response do
    json.code 404
  end
end
