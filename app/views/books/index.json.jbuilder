json.array!(@books) do |book|
  json.extract! book, :id, :title, :bio, :release
  json.url book_url(book, format: :json)
end
