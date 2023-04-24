require 'webrick'

server = WEBrick::HTTPServer.new(
  DocumentRoot: './',
  BindAddress: '0.0.0.0',
  port: 8000

)

server.mount_proc('/') do |req, res|
  res.body = 'Hello, world!'
end

server.start

