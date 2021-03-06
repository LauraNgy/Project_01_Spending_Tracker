require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require('pry-byebug')
also_reload('../models/*')

# index
# index is basically built from account_controller

# new
get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @accounts = Account.all()
  @account_id = params['account_id'].to_i
  erb (:"transactions/new")
end


# create
post '/transactions' do
  @new_transaction = Transaction.new(params)
  @new_transaction.save()
  redirect to '/accounts'
end


# show
get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  @merchant = @transaction.merchant()
  @tag = @transaction.tag()
  erb (:"transactions/show")
end

# edit
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'].to_i)
  @tags = Tag.all()
  @merchants = Merchant.all()
  @accounts = Account.all()
  erb (:"transactions/edit")
end

# update
post '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect to '/accounts'
end


#delete
post '/transactions/:id/delete' do
  Transaction.delete(params['id'].to_i)
  redirect to '/accounts'
end
