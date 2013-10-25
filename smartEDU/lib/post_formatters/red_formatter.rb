module Forem
  module Formatters
    class RedFormatter
      def self.format(text)
        htmlRenderer = Redcarpet::Render::HTML.new(render_options = {
                                                     :no_links => true,
                                                     :hard_wrap => true
                                                   })

        markdown = Redcarpet::Markdown.new(htmlRenderer,
                                           {})
        markdown.render(text).html_safe
      end
    end
  end 
end

