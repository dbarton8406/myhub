require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true


    # Your code here ...
    get "/" do
      api = Github.new
      issue = api.get_issues
      erb :index, locals: { issues: issue}
    end

    post "/issue/reopen/:id" do
      api = Github.new
      api.reopen_issue( params["id"].to_i)
      redirect "/"
    end

    post "/issue/close/:id" do
      api = Github.new
      api.close_issue(params["id"].to_i)
      redirect "/"
    end

    run! if app_file == $0
  end
end
