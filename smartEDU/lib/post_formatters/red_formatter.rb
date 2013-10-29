module Forem
  module Formatters
    class RedPlus < Redcarpet::Render::HTML
      def initialize(config = {
                       # :no_links => true,
                       :filter_html => true,
                       :hard_wrap => true
                     })
        super
        @markdown = Redcarpet::Markdown.new(self,
                                           {
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
        puts link, link_type
        puts "abi"
        return "autolink function"
      end

      def link(link, title, content)
        puts "abi link"
        return "link function"
      end
      # process text to identify youtube links and generate
      # a div with an iframe embed of the youtube URL
      def youtube_processor(text)
      end


    end

  end 
end

