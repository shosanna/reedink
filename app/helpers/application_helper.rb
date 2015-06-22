module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice  then "alert alert-info"
    when :success then "alert alert-success"
    when :error   then "alert alert-danger"
    when :alert   then "alert alert-danger"
    when :warning then "alert alert-warning"
    else
      "alert alert-info"
    end
  end

  def nav_link(name, link_path = nil, &block)
    link_path = name if block_given?

    class_name = if current_page?(link_path)
                   "active"
                 end

    content_tag(:li, class: class_name) do
      if block_given?
        link_to link_path, &block
      else
        link_to name, link_path
      end
    end
  end

  def shorten(text, length = 30)
    if text.length > 30
      text[0..28] + "..."
    else
      text
    end
  end
end
