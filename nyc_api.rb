 require 'net/http'
 require 'open-uri'
 require 'json'
 
 class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end
  
  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]  
    end
  end

end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq



# we could easily adapt this code to be flexible and accept any URL we pass in using an initialize method and an instance variable. The get_programs method is really just getting the response body of from the requested URL, so we could name this get_response_body to be more accurate. We could replace the custom program_school method with a general parse_json method, as well. Instead of a specific class, we would instead have a class that retrieves JSON from any provided URL!