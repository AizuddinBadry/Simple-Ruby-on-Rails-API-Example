require 'httparty'

task :billplz => :environment do
    auth = {:username => "73eb57f0-7d4e-42b9-a544-aeac6e4b0f81:"}
    @blah = HTTParty.post("https://www.billplz.com/api/v3/bills", 
                          {
                        :body => [ { "collection_id" => "inbmmepb", "amount" => "300" } ].to_json,
                         :basic_auth => auth
                         })
    @blah.parsed_response
  end