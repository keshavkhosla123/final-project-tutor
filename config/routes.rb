Rails.application.routes.draw do

  # Home Page
  get("/", {:controller => "application", :action => "index_homepage"})

  # Details Page for each user

  get("/user_details/:user_id", {:controller=>"application", :action => "show_details"})

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
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
             
  #------------------------------

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  get("/messages/:path_id", { :controller => "messages", :action => "show" })
  
  # UPDATE
  
  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  # Routes for the Subject need help in resource:

  # CREATE
  post("/insert_subject_need_help_in", { :controller => "subject_need_help_ins", :action => "create" })
          
  # READ
  get("/subject_need_help_ins", { :controller => "subject_need_help_ins", :action => "index" })
  
  get("/subject_need_help_ins/:path_id", { :controller => "subject_need_help_ins", :action => "show" })
  
  # UPDATE
  
  post("/modify_subject_need_help_in/:path_id", { :controller => "subject_need_help_ins", :action => "update" })
  
  # DELETE
  get("/delete_subject_need_help_in/:path_id", { :controller => "subject_need_help_ins", :action => "destroy" })

  #------------------------------

  # Routes for the Subjects can teach resource:

  # CREATE
  post("/insert_subjects_can_teach", { :controller => "subjects_can_teaches", :action => "create" })
          
  # READ
  get("/subjects_can_teaches", { :controller => "subjects_can_teaches", :action => "index" })
  
  get("/subjects_can_teaches/:path_id", { :controller => "subjects_can_teaches", :action => "show" })
  
  # UPDATE
  
  post("/modify_subjects_can_teach/:path_id", { :controller => "subjects_can_teaches", :action => "update" })
  
  # DELETE
  get("/delete_subjects_can_teach/:path_id", { :controller => "subjects_can_teaches", :action => "destroy" })

  #------------------------------

  # Routes for the Subject resource:

  # CREATE
  post("/insert_subject", { :controller => "subjects", :action => "create" })
          
  # READ
  get("/subjects", { :controller => "subjects", :action => "index" })
  
  get("/subjects/:path_id", { :controller => "subjects", :action => "show" })
  
  # UPDATE
  
  post("/modify_subject/:path_id", { :controller => "subjects", :action => "update" })
  
  # DELETE
  get("/delete_subject/:path_id", { :controller => "subjects", :action => "destroy" })

  #------------------------------

end
