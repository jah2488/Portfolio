atom_feed do |feed|
  feed.title "Justin Herrick's Blog"
  feed.updated @updated

  @posts.each do |post|
    next if post.updated_at.blank?

    feed.entry( post ) do |entry|
      entry.url post_url(post)
      entry.title post.title
      entry.content markdown(post.body), :type => 'html'

      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name( "Justin Herrick" )
      end

    end
  end
end
