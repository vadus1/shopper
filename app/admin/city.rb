ActiveAdmin.register City do
  belongs_to :country
  permit_params *City.attribute_names
end