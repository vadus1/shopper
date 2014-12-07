ActiveAdmin.register ShippingRate do

  menu priority: 5, label: proc{ I18n.t("active_admin.shipping_rate") }

  action_item do
    link_to "Добавить страну", new_admin_shipping_rate_country_path(shipping_rate) if action_name == 'show'
  end

   index do
    column :name
    column :rate
    default_actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :rate
    end

    panel "Страны" do
      table_for shipping_rate.countries do
        column "Название Стран" do |country|
          link_to country.name, admin_shipping_rate_country_path(shipping_rate, country)
        end
      end
    end
  end

  form partial: 'form'
end
