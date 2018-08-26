require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/account_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/tag_controller')
require_relative('controllers/transaction_controller')

get '/' do
  erb( :index )
end
