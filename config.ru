require_relative "test_api"
require_relative "app"


map "/" do
  run App.new
end
