module ApplicationHelper

  def form_group_tag(errors, &block)
  css_class = 'form-group'
  css_class << 'has-error' if errors.any?

  # create a div of form-group class, and displays an error
  content_tag(:div, capture(&block), class: css_class)
  end


  def markdown(text)



# how it's parsed
      extensions = {
        autolink:           true,
        superscript:        true,
        space_after_headers: true,
        fenced_code_blocks: true,
        disable_indented_code_blocks: true,
        quote: true
      }

      # how it's rendered
        options = {
          filter_html:     false,
          hard_wrap:       true,
          link_attributes: { rel: 'nofollow', target: "_blank" }
        }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end


    # def markdown(text)
    #   # specify how to parse text
    #   options = {
    #     filter_html
    #   }




end
