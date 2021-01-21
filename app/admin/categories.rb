ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :parent_id

  index do
    selectable_column
    id_column
    column :name
    column :parent_id
    actions
  end

  filter :name
  filter :parent_id
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :parent_id
    end
    f.actions
  end
end
