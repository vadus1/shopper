ActiveAdmin.register Order do
  menu priority: 4, label: proc{ I18n.t("active_admin.orders") }

  config.per_page = 20
  scope :only_completed, default: true
  scope :only_cart
  scope :only_shipping
  scope :only_cancel

  actions :all, except: :new

  index do
    column "Email пользователя" do |order|
      order.address.email rescue ""
    end
    column "Адрес" do |order|
      order.address
    end
    column("Статус") do |order|
      case order.state
        when "cart"      then status_tag(order.state)
        when "purchased" then status_tag(order.state, :ok)
        when "canceled"  then status_tag(order.state, :error)
        when "shipped"  then status_tag(order.state, :ok)
      end
    end
    column("Баланс") do |order|
      order.balance
    end
    default_actions
  end

  form partial: 'form'
end