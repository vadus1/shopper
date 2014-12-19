# encoding: UTF-8
module ApplicationHelper
  def number_to_price price
    number_to_currency(price, precision: 0)
  end

  def render_menu_for text, path, regxp = nil
    active = request.path == path ? 'active' : ''
    active = request.path.match(regxp) ? 'active' : '' if regxp

    content_tag :li, class: active do
      link_to text, path
    end
  end

  def render_cart_menu
    active = request.path == edit_cart_path(current_order.id) ? 'active' : ''

    content_tag :span, class: "cart-link cart #{active}" do
      link_to (current_user and active.eql?('active')) ? edit_cart_path(current_order.id) : cart_path(current_order), class: 'cart_link', remote: (not active.eql?('active')) do
        if current_order.items_count.eql?(0)
          "Нет товаров"
        else
          "Товаров - #{current_order.items_count}".html_safe
        end
      end
    end
  end

  def render_cart_menu_button
    active = request.path == edit_cart_path(current_order.id) ? 'active' : ''

    content_tag :div, class: "cart #{active} buttons" do
      link_to (current_user and active.eql?('active')) ? edit_cart_path(current_order.id) : cart_path(current_order), class: 'cart_link', remote: (not active.eql?('active')) do
        "<span class='begin'></span><span><b>В корзину</b></span><span class='end'></span><div class='clear'></div>".html_safe
      end
    end
  end

  def render_user_menu
    active = 'active' if request.path.match(/users/)

    content_tag :li, class: "dropdown #{active}" do
      if current_user
        link = link_to '#', class: 'dropdown-toggle', data: { toggle: 'dropdown' } do
          concat "#{current_user} <b class=\"caret\"></b>".html_safe
        end
        menu = content_tag :ul, class: "dropdown-menu" do
          concat render_menu_for("Profile", edit_user_registration_path) unless current_user.guest?
          concat render_menu_for("Orders History", user_orders_path(current_user)) unless current_user.guest?
          concat content_tag :li, (link_to "Log out", destroy_user_session_path, method: :delete)
        end

        link.concat menu
      else
        link = link_to '#', class: 'dropdown-toggle', data: { toggle: 'dropdown' } do
          concat "Login / Register <b class=\"caret\"></b>".html_safe
        end
        menu = content_tag :ul, class: "dropdown-menu" do
          concat render_menu_for("Login", new_user_session_path)
          concat render_menu_for("Register", new_user_registration_path)
        end

        link.concat menu
      end
    end
  end

  def full_title page_title
    base_title = "Tokebi"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
