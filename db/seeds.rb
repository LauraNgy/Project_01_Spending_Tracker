require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()
Account.delete_all()


###########TAGS##############

@tag1 = Tag.new({
  "name" => "groceries"
  })

@tag2 = Tag.new({
  "name" => "beauty"
  })

@tag3 = Tag.new({
  "name" => "transport"
  })

@tag4 = Tag.new({
  "name" => "entertainment"
  })

@tag1.save()
@tag2.save()
@tag3.save()
@tag4.save()


##########MERCHANTS##########
@merchant1 = Merchant.new({
  "name" => "Tesco"
  })

@merchant2 = Merchant.new({
  "name" => "Amazon"
  })

@merchant3 = Merchant.new({
  "name" => "e-bay"
  })

@merchant4 = Merchant.new({
  "name" => "The Cafe"
  })

@merchant1.save()
@merchant2.save()
@merchant3.save()
@merchant4.save()


########ACCOUNTS#############
@account1 = Account.new({
  "holder" => "Amy",
  "currency" => "pounds",
  "budget" => 0
  })

@account2 = Account.new({
  "holder" => "Dan",
  "currency" => "potatoes",
  "budget" => 0
  })

@account3 = Account.new({
  "holder" => "Rick",
  "currency" => "schmeckles",
  "budget" => 0
  })

@account1.save()
@account2.save()
@account3.save()


#######TRANSACTIONS##########
@transaction1 = Transaction.new({
  "amount" => 10,
  "merchant_id" => @merchant1.id,
  "tag_id" => @tag1.id,
  "description" => "food",
  "account_id" => @account1.id,
  "transaction_date" => "3 Jan 2017"
  })

@transaction2 = Transaction.new({
  "amount" => 15,
  "merchant_id" => @merchant3.id,
  "tag_id" => @tag4.id,
  "description" => "video games",
  "account_id" => @account3.id,
  "transaction_date" => "21 Jan 2019"
  })

@transaction3 = Transaction.new({
  "amount" => 12.3,
  "merchant_id" => @merchant2.id,
  "tag_id" => @tag1.id,
  "description" => "toilet paper",
  "account_id" => @account1.id,
  "transaction_date" => "01 Mar 2018"
  })

@transaction4 = Transaction.new({
  "amount" => 2.5,
  "merchant_id" => @merchant2.id,
  "tag_id" => @tag3.id,
  "description" => "bike helmet",
  "account_id" => @account1.id,
  "transaction_date" => "10 Mar 2018"
  })


@transaction1.save()
@transaction2.save()
@transaction3.save()
@transaction4.save()


binding.pry
nil
