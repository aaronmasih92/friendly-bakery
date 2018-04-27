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
    value: '<ul>
	<li>Cookies:</li>
	<li></li>
	<li>Chocolate Chip // 12 cookies: $24</li>
	<li></li>
	<li>Red Velvet // 12 cookies: $24</li>
	<li></li>
	<li>Peanut Butter Chocolate Chip // 12 cookies: $24</li>
	<li></li>
	<li>Double Chocolate Chip // 12 cookies: $24</li>
	<li></li>
	<li>Oatmeal Raisin Cookie // 12 cookies: $24</li>
	<li></li>
	<li>Sugar Cookie  // 12 cookies: $24</li>
	<li></li>
	<li>Cakes:</li>
	<li></li>
	<li>Black Forest Cake // Whole: $65 // Slice: $8.50</li>
	<li></li>
	<li>Strawberry Cake // Whole: $65 // Slice: $8.50</li>
	<li></li>
	<li>Dads Chocolate Cake // Whole: $65 // Slice: $8.50</li>
	<li></li>
	<li>Cheesecake // Whole: $65 // Slice: $8.50</li>
	<li></li>
	<li>Tres Leches Cake // Whole: $65 // Slice: $8.50</li>
	<li></li>
	<li>Red Velvet Cake // Whole: $65 // Slice: $8.50</li>
	<li></li>
	<li>Muffins </li>
	<li></li>
	<li>Banana Muffin // $2.50</li>
	<li></li>
	<li>Corndog Muffin // $5.00</li>
	<li></li>
	<li>Double Chocolate Chip Muffin // $2.50</li>
	<li></li>
	<li>Zucchini Bread Bran Muffin // $4.50</li>
	<li></li>
	<li>Chocolate Chip Muffin // $1.50</li>
	<li></li>
	<li>Apple Coffee Cake Muffin // $3.00</li>
</ul>
    
        ')
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


