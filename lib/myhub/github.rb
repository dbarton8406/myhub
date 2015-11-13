module Myhub
  class Github
    include HTTParty

    base_uri "https://api.github.com"


    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end
    def get_issues
      issues = self.class.get("/orgs/TIY-ATL-ROR-2015-Sep/issues",
                              headers: @headers, query: { state: "all"})

      # puts issues -"this was added to erb "
      # issues.map { |issue| {id: issue["number"],
      #                       title: issue["title"],
      #                       url: issue["html_url"],
      #                       state: issue["state"]} }
    end

    def reopen_issue(number)
      self.class.patch("/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{number}",
                       :headers => @headers,
                       :body => {:state => "open"}.to_json)
    end

    def close_issue(number)
      self.class.patch("/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{number}",
                       :headers => @headers,
                       :body => {:state => "closed"}.to_json)

    end
  end
end
