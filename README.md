## Kata: Implement a very basic Framework on top of Rack

* needs to support GET and POST requests
* allows you to define blocks like this
```
get "/bla" do
  { results: [1, 2, 3] }
end

post "/bla" do |params|
  name = params[:name]

  { name: name }
end
```
* responds accordingly
