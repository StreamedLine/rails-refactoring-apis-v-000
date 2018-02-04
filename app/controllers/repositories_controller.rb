class RepositoriesController < ApplicationController
  def index    				 
    repo_service = GithubRepo.new({"access_token" => session[:token]})

    @username = session[:username]
    @repos_array = repo_service.get_repos
  end

  def create
    repo_service = GithubRepo.new({"name" => params[:name], "access_token" => session[:token]})
    repo_service.create_repo
    
    redirect_to '/'
  end
end
