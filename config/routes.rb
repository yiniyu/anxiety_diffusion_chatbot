Rails.application.routes.draw do
  # Routes for the Perspective resource:

  # CREATE
  get("/perspectives/new", { :controller => "perspectives", :action => "new_form" })
  post("/create_perspective", { :controller => "perspectives", :action => "create_row" })

  # READ
  get("/perspectives", { :controller => "perspectives", :action => "index" })
  get("/perspectives/:id_to_display", { :controller => "perspectives", :action => "show" })

  # UPDATE
  get("/perspectives/:prefill_with_id/edit", { :controller => "perspectives", :action => "edit_form" })
  post("/update_perspective/:id_to_modify", { :controller => "perspectives", :action => "update_row" })

  # DELETE
  get("/delete_perspective/:id_to_remove", { :controller => "perspectives", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
