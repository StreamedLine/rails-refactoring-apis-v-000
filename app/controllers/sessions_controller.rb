class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    repo_service = GithubRepo.new({})
    repo_service.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])

    session[:access_token] = repo_service.access_token
    session[:username] = repo_service.name

    redirect_to '/'
  end
end