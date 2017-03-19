module ApplicationHelper

  def form_group_tag(errors, &block)
  css_class = 'form-group'
  css_class << 'has-error' if errors.any?

  # create a div of form-group class, and displays an error
  content_tag(:div, capture(&block), class: css_class)
  end

end
