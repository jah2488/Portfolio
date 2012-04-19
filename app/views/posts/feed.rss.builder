xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Justin Herrick's Personal Blog"
    xml.description "A blog of rants, thoughts, introspection, speculation, and code"
    xml.link posts_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.pubdate
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
