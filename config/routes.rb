Rails.application.routes.draw do

  #Home Page

  #Temporary

  get("/", { :controller => "releases", :action => "index" })

  # Routes for the Watchlist title resource:

  # CREATE
  post("/insert_watchlist_title", { :controller => "watchlist_titles", :action => "create" })

  # READ
  get("/watchlist_titles", { :controller => "watchlist_titles", :action => "index" })

  get("/watchlist_titles/:path_id", { :controller => "watchlist_titles", :action => "show" })

  # UPDATE

  post("/modify_watchlist_title/:path_id", { :controller => "watchlist_titles", :action => "update" })

  # DELETE
  get("/delete_watchlist_title/:path_id", { :controller => "watchlist_titles", :action => "destroy" })

  #------------------------------

  # Routes for the Release resource:

  # CREATE
  post("/insert_release", { :controller => "releases", :action => "create" })

  # READ
  get("/releases", { :controller => "releases", :action => "index" })

  get("/releases/:path_id", { :controller => "releases", :action => "show" })

  # UPDATE

  post("/modify_release/:path_id", { :controller => "releases", :action => "update" })

  # DELETE
  get("/delete_release/:path_id", { :controller => "releases", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  # Routes for the Subscription resource:

  # CREATE
  post("/insert_subscription", { :controller => "subscriptions", :action => "create" })

  # READ
  get("/subscriptions", { :controller => "subscriptions", :action => "index" })

  get("/subscriptions/:path_id", { :controller => "subscriptions", :action => "show" })

  # UPDATE

  post("/modify_subscription/:path_id", { :controller => "subscriptions", :action => "update" })

  # DELETE
  get("/delete_subscription/:path_id", { :controller => "subscriptions", :action => "destroy" })

  #------------------------------

  #------------------------------

end
