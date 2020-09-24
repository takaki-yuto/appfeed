module MarkdownHelper
  require 'redcarpet'
  require 'coderay'
  
  REDCARPET_OPTIONS = {
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,    
    strikethrough: true,
    quote: true,
    filter_html: true, 
    hard_wrap: true
  }
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language.strip
      language = language.nil? ? "md" : language.split(':')[0]
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when 'js'
        lang ='javascript'
      when 'html'
        lang = 'html'
      else ''
        lang = language
      end
      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new
    markdown = Redcarpet::Markdown.new(html_render, REDCARPET_OPTIONS)
    sanitize(markdown.render(text))
  end


end
