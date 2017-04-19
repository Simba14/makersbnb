class FourM < Sinatra::Base

  get('/spaces') do
    @users = User.first
    @spaces = Space.all
    erb :'spaces/index'
  end

  get('/spaces/new') do
    erb :'spaces/new'
  end

  post('/spaces') do
    Space.create(space_name: params[:space_name], description: params[:description], price: params[:price])
    redirect('/spaces')
  end
end