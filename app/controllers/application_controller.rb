require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  # index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #create action
  get '/recipes/new' do
    @recipe = Recipe.create(params[:recipe])
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params[:recipe])
    redirect '/recipes'
  end

  #show action
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #edit action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  #delete action
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end



end
