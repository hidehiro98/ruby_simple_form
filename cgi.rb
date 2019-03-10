require 'cgi'

cgi = CGI.new
cgi.out(type: 'text/html',
        charset: 'UTF-8') do
  get = cgi['a']
  "<html><body><p>#{get}</p></body></html>"
end
