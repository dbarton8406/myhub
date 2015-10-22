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
      issues =api.get_issues
      issues =[]
      issues.map do |issue|
      info = {
          title: issue["title"],
          url: issue["url"],
          number: issue["number"],
          state: issue["state"]
        }
        
      end
      erb :index, locals: { issues: api.get_issues}
    end

    post "/issue/reopen/:id" do
      api = Github.new
      api.reopen_issue("TIY-ATL-ROR-2015-Sep", "assignments", params["id"].to_i)
      "This will reopen issue"
    end

    post "/issue/delete/:id" do
      api = Github.new
      api.close_issue("TIY-ATL-ROR-2015-Sep","assignments", params["id"].to_i)
      "This will close issue"
    end

    run! if app_file == $0
  end
end
