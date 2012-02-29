module ApplicationHelper

  def title(title)
    content_for(:title, "#{title} - JustinHerrick.com")
  end

  def description(description)
    content_for(:description, desc)
  end

  def keywords(keywords)
    content_for(:keywords, keywords)
  end

  def yield_for(content_sym, default)
    ouput = content_for(content_sym).presence || default
  end

  def markdown(text)
    renderer = PrettifyRenderer.new
    md = Redcarpet::Markdown.new(renderer,:hard_wrap => true, :autolink => true, :no_intraemphasis => true, :fenced_code_blocks => true, :gh_blockcode => true)
    markdowned = md.render(text)
    renderer.add_classes(markdowned).html_safe
  end

end
