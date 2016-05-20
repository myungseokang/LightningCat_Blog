module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        'success'   # Green
      when 'error'
        'warning'   # Yellow
      when 'alert'
        'alert'     # Red
      when 'notice'
        'primary'   # Blue
      else
        flash_type.to_s
    end
  end

  def active_menu(target_controller)
    "class=#{controller_name == target_controller ? 'active' : ''}"
  end

  def user_email(post)
    post.user.present? ? post.user.email : "an anonymous user"
  end

  def user_roles(user)
    user.roles.map(&:name).join(', ').titleize
  end

  def published_icon(boolean)
    if boolean
      content_tag( :i, ' ', class: 'fi-check') + '작성완료'
    else
      content_tag( :i, ' ', class: 'fi-pencil') + '작성중...'
    end
  end

  def icon_button(shape)
    content_tag(:span, class:'badge') do
      content_tag( :i, '', class: "fi-#{shape}")
    end
  end

end
