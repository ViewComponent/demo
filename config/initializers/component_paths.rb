ActiveSupport.on_load :action_controller do
  append_view_path Rails.root.join("app", "components")
end
