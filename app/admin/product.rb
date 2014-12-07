ActiveAdmin.register Product do
  belongs_to :category

  filter :category
  filter :name
  filter :description
  filter :quantity
  filter :price
  filter :created_at
  filter :updated_at

  before_filter do
    @category = Category.find(params[:category_id])
  end

  index do
    column :id
    column :name
    column :quantity
    column "Цена" do |product|
      number_to_currency(product.price)
    end
    column :created_at
    column :updated_at
    default_actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :description
      row :quantity
      row :price
      row "Изображение" do |product|
        image_tag(product.cover.thumb)
      end
    end
  end
end
