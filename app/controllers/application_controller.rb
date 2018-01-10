class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name],ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    @recipe = Post.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end


  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end

end
