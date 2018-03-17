module MarkdownField
  extend ActiveSupport::Concern

  module ClassMethods
    def markdown_field(field, opts={})
      method_name = "#{field}_html"
      if opts[:name]
        method_name = opts[:name]
      end
      self.define_method(method_name) do
        text = self.send(field)
        Kramdown::Document.new(text).to_html
      end
    end
  end
end
