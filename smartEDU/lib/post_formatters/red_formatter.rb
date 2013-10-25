module Forem
  module Formatters
    class RedPlus < Redcarpet::Render::HTML
      def initialize(config = {
                       :no_links => true,
                       :hard_wrap => true
                     })
        super
        @markdown = Redcarpet::Markdown.new(self,
                                           {:fenced_code_blocks => true})
      end

      def format(text)
        @markdown.render(text).html_safe
      end


      def block_code(code, language)
        Pygments.highlight(code, lexer: language)
      end
    end

  end 
end

