Rails.application.routes.draw do
  devise_for :users
  resources :skins do
    resources :bids, only: :create
  end

  root "skins#index"
  #Skins
  get("/", {controller: "skins", action: "index"})
  get("/skins/:id",{controller:"skins",action:"show"})

  #Profile 
  get("/userinfo/:username", {controller:"users",action:"show"})
end

  # get("/skins/:path_id")



#   get("/", { :controller => "boards", :action => "index" })

#   # Routes for the Post resource:

#   # CREATE
#   post("/insert_post", { :controller => "posts", :action => "create" })
          
#   # READ
#   get("/posts", { :controller => "posts", :action => "index" })
  
#   get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
#   # UPDATE
  
#   post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
#   # DELETE
#   get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

#   #------------------------------

#   # Routes for the Board resource:

#   # CREATE
#   post("/insert_board", { :controller => "boards", :action => "create" })
          
#   # READ
#   get("/boards", { :controller => "boards", :action => "index" })
  
#   get("/boards/:path_id", { :controller => "boards", :action => "show" })
  
#   # UPDATE
  
#   post("/modify_board/:path_id", { :controller => "boards", :action => "update" })
  
#   # DELETE
#   get("/delete_board/:path_id", { :controller => "boards", :action => "destroy" })

#   #------------------------------

#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
