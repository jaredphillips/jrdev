json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :url, :promoted
  json.url article_url(article, format: :json)
end
