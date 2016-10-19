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

## Trial run

### GET /bla
```
curl localhost:9292/bla -v
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 9292 (#0)
> GET /bla HTTP/1.1
> Host: localhost:9292
> User-Agent: curl/7.43.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Type: application/json
< Transfer-Encoding: chunked
< Server: WEBrick/1.3.1 (Ruby/2.2.4/2015-12-16)
< Date: Wed, 19 Oct 2016 07:56:34 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact
{"results":[1,2,3]}%
```

### POST /bla
```
curl localhost:9292/bla -H 'Content-Type: application/json' -XPOST -d '{"name": "Daniel"}' -v
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 9292 (#0)
> POST /bla HTTP/1.1
> Host: localhost:9292
> User-Agent: curl/7.43.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 18
>
* upload completely sent off: 18 out of 18 bytes
< HTTP/1.1 200 OK
< Content-Type: application/json
< Transfer-Encoding: chunked
< Server: WEBrick/1.3.1 (Ruby/2.2.4/2015-12-16)
< Date: Wed, 19 Oct 2016 07:57:56 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact
{"name":"Daniel"}%
```

### Path does not exist
```
curl localhost:9292/blubb -v
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 9292 (#0)
> GET /blubb HTTP/1.1
> Host: localhost:9292
> User-Agent: curl/7.43.0
> Accept: */*
>
< HTTP/1.1 404 Not Found
< Content-Type: text/plain
< Transfer-Encoding: chunked
< Server: WEBrick/1.3.1 (Ruby/2.2.4/2015-12-16)
< Date: Wed, 19 Oct 2016 07:59:11 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact
not found%
```

### METHOD other than GET or POST
```
curl localhost:9292/blubb -XPATCH -v
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 9292 (#0)
> PATCH /blubb HTTP/1.1
> Host: localhost:9292
> User-Agent: curl/7.43.0
> Accept: */*
>
< HTTP/1.1 405 Method Not Allowed
< Content-Type: text/plain
< Transfer-Encoding: chunked
< Server: WEBrick/1.3.1 (Ruby/2.2.4/2015-12-16)
< Date: Wed, 19 Oct 2016 07:59:49 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact
method not supported%
```
