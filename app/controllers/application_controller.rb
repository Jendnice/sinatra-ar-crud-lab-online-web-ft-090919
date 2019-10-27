
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  
  end 

  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do 
    @article = Article.create(params[:article])
    
    redirect "/articles/:id"
  end 
  
  get '/articles' do 
    @articles = Article.all 
    
    erb :index
  end 
  
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    
    erb :show 
  end 
 
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
     
    erb :edit 
  end 
  
  patch "/articles/:id" do 
    @article = Article.find(params[:id])
    new_article = @article.update(params[:edit_article])
    new_article.save
    
    redirect '/articles/:id"'
  end 
  
  delete "/articles/:id" do 
    @article = Article.find(params[:id])
    delete_article = @article.destroy 
  
    redirect "/articles"
  end 
  
end
