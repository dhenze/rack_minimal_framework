require_relative "trial_day"

get "/bla" do
  { results: [1, 2, 3] }
end

post "/bla" do |params|
  name = params[:name]

  { name: name }
end

map "/" do
  run TrialDay::App.new
end