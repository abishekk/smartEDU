module Forem
  module Formatters
    class RedPlus < Redcarpet::Render::HTML
      include ActionView::Helpers::UrlHelper
      def initialize(config = {
                       :filter_html => true,
                       :hard_wrap => true
                     })
        super
        @markdown = Redcarpet::Markdown.new(self,
                                           {
                                              :no_intra_emphasis => true,
                                              :autolink => true,
                                              :fenced_code_blocks => true
                                            })
        @mathjax_cdn = 'http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
      end

      attr_reader :mathjax_cdn

      def format(text)
        @markdown.render(text).html_safe
      end


      def block_code(code, language)
        Pygments.highlight(code, lexer: language)
      end

      def autolink(link, link_type)
        if link_type == "email" then
          x = mail_to link, link, :class => "autolink"
        else
          x = link_to link, link, :class => "autolink"
          x += youtube_processor(link)
        end
        return x.html_safe
      end

      def link(link, title, content)
        x = link_to content, link, :title => title, :class => "mdlink"
        x += youtube_processor(link)
        return x.html_safe
      end
      # process text to identify youtube links and generate
      # a div with an iframe embed of the youtube URL
      def youtube_processor(link)
        youtube_url = link
        youtube_id = nil
        if youtube_url[/youtu\.be\/([^\?]*)/]
          youtube_id = $1
        else
          youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
          youtube_id = $5
        end
        if (youtube_id.nil?)
          return nil
        else
          data = %Q'<div class="flex-video"><iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe></div>'
          return data.html_safe
        end
      end
    end
  end
end
