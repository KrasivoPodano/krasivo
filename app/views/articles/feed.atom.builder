atom_feed :language => 'ru-RU' do |feed|
  feed.title @title
  feed.updated @updated

  @articles.each do |article|
    next if article.updated_at.blank?

    feed.entry( article ) do |entry|
      entry.url article_url(article)
      entry.title article.title
      entry.content article.text, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(article.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

    end
  end
end