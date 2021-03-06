require "json"

module TrialDay
  GET_MAPPING = {}
  POST_MAPPING = {}

  def get(path, &block)
    GET_MAPPING[path] = block
  end

  def post(path, &block)
    POST_MAPPING[path] = block
  end


  class App
    NOT_FOUND_RESPONSE = [ 404, { "Content-Type" => "text/plain" }, [ "not found" ]]
    def call(env)
      request = Rack::Request.new( env )
      if request.request_method == "GET"
        return NOT_FOUND_RESPONSE unless TrialDay::GET_MAPPING.include?( request.path )
        result = TrialDay::GET_MAPPING[ request.path ].call

        [ 200, { "Content-Type" => "application/json" }, [ JSON.generate( result ) ] ]
      elsif request.request_method == "POST"
        return NOT_FOUND_RESPONSE unless TrialDay::POST_MAPPING.include?( request.path )
        body_params = JSON.parse( request.body.read ).each_with_object( {} ){ |(k,v), h| h[ k.to_sym ] = v }
        result = TrialDay::POST_MAPPING[ request.path ].call( body_params )

        [ 200, { "Content-Type" => "application/json" }, [ JSON.generate( result ) ] ]
      else
        [ 405, { "Content-Type" => "text/plain" }, [ "method not supported" ] ]
      end
    end
  end
end

include TrialDay
