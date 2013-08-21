atom_feed :language => 'ru-RU' do |feed|
  feed.title @title
  feed.updated @updated

  @events.each do |event|
    next if event.updated_at.blank?

    feed.entry( event ) do |entry|
      entry.url event_url(event)
      entry.title event.title
      entry.date event.date
      entry.content event.text, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(event.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

    end
  end
end