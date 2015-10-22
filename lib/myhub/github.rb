module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end
    def get_issues
      self.class.get("/orgs/TIY-ATL-ROR-2015-Sep/issues",
                     :headers => @auth, query: { state: "all" })
    end
       
    def open_issue(number)
      self.class.patch("/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{number}",
                      :headers => @auth,
                      :body => {:state => "open"}.to_json)
    end  

    def close_issue(number)
      self.class.patch("/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{number}",
                      :headers => @auth,
                      :body => {:state => "closed"}.to_json)

    end
  end
end
