json.extract! book, :id, :title, :description, :isbn, :genre, :publish_date, :num_page, :image_url, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
