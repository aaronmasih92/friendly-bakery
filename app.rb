require 'sinatra'
require 'sendgrid-ruby'
include SendGrid

to = Email.new(email: 'aaronmasih@me.com')
sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])


get "/" do
    erb :index
end

get "/muffins" do
    erb :muffins
end

get "/cakes" do
    erb :cakes
end

get "/cookies" do
    erb :cookies
end

get "/contact" do
 erb :contact
end

post '/form' do
    from = Email.new(email:'aaronmasih@me.com')
    to = Email.new(email: params[:email])
    subject = 'Ronnies Sweet Spot Catalog'
    content = Content.new(type: 'text/html', 
    value: '<p>hiiiii<p>')
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    #puts response.parsed_body
    puts response.headers

    redirect "/thankyou"

end

get "/thankyou" do
    erb :thankyou
end


