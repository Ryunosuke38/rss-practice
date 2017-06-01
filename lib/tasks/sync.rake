namespace :sync do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        image = Nokogiri::HTML.parse(entry.summary).css('img').to_a
        image_url = image.first[:src]
        content = Nokogiri::HTML.parse(entry.summary).inner_text
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: content, author: entry.author, image_url: image_url, url: entry.url, published: entry.published)
      end
    end

    puts "Success!!!"
  end
end
