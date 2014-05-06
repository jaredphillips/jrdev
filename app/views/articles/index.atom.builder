atom_feed do |feed|
	feed.title "The Junior Developer"
	@articles.each do |article|
		feed.entry(article, url: article.url) do |entry|
			entry.title article.title 
			entry.description article.description
		end
	end
end