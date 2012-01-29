class PrettifyRenderer < Redcarpet::Render::HTML
  attr_accessor :pre_list

  def initialize  
    @pre_list = []
    super
  end

  def add_classes(text)
    text.gsub!(/<pre>/, '<pre class="prettyprint linenums">')
    text.gsub!(/<pre class="prettyprint"><code class="(?<class>[a-z][a-z])">/, '<pre class="prettyprint"><code class="language-\k<class>">' )
    return text
  end

end