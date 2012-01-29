module ApplicationHelper

  def title(title)
    content_for(:title, title)
  end

  def description(description)
    content_for(:description, desc)
  end

  def keywords(keywords)
    content_for(:keywords, keywords)
  end
  
  def markdown(text)
    renderer = PrettifyRenderer.new
    md = Redcarpet::Markdown.new(renderer,:hard_wrap => true, :autolink => true, :no_intraemphasis => true, :fenced_code_blocks => true, :gh_blockcode => true)
    markdowned = md.render(text)
    renderer.add_classes(markdowned).html_safe
  end

end
