if @books.present?
  json.array!(@books) do |book|
    json.extract! book, 	:id, :title, :description, :genre_name, :author_name, :cover_art_base_64 
	end
else  
  json.response do
    json.code 404
  end
end
