if @books.present?
  json.array!(@books) do |book|
    json.extract! book, 	:id, :title, :description, :genre, :author 
	end
else  
  json.response do
    json.code 404
  end
end
