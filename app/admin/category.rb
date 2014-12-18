ActiveAdmin.register Category do

  menu priority: 4, label: proc{ I18n.t("active_admin.category") }

  action_item do
    link_to "Новый Товар", new_admin_category_product_path(category) if action_name == 'show'
  end

  before_filter :only => [:show, :edit, :update, :destroy] do
    @category = Category.find(params[:id])
  end

  index do
    column :name
    column :description
    default_actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :description
      row "Изображение" do |course|
        image_tag(category.cover, { size: '150x100' })
      end
    end

    panel "Товар" do
      table_for category.products do
        column "Изображение" do |product|
          image_tag(product.cover, { size: '50x50' })
        end
        column "Название" do |product|
          link_to product.name, admin_category_product_path(category, product)
        end
        column "Описание" do |product|
          truncate(product.description, length: 400)
        end
        column "Количество" do |product|
          product.quantity
        end
        column "Цена" do |product|
          number_to_price(product.price)
        end
      end
    end
  end

  form partial: 'form'
end
