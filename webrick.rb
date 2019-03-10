require 'webrick'

server = WEBrick::HTTPServer.new({
  DocumentRoot:   './',
  BindAddress:    '127.0.0.1',
  Port:           8080,
  CGIInterpreter: '/usr/bin/ruby'
})

# server.mount('/', WEBrick::HTTPServlet::FileHandler, 'index.html')
server.mount_proc '/' do |req, res|
  File.open("index.html") do |f|
    res.body = f.read
    res['content-type'] = "text/html; charset=utf8" # これがないと文字化けする
  end
end

server.mount_proc '/params' do |req, res|
  res.body = req.query['a']
end

server.mount('/cgi', WEBrick::HTTPServlet::CGIHandler, './cgi.rb')

server.start

# https://qiita.com/littlekbt/items/018a1630101e0521e518
# http://haraita9283.blog98.fc2.com/blog-entry-417.html
