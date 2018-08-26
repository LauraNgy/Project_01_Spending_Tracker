class Transaction

  attr_accessor :id, :amount, :merchant_id, :tag_id, :description, :currency_type, :transaction_date

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @amount = params['amount'].to_i
    @merchant_id = params['merchant_id'].to_i
    @tag_id = params['tag_id'].to_i
    @description = params['description']
    @currency_type = params['currency_type']
    @transaction_date = params['transaction_date']
  end

  def save()
    sql = "
      INSERT INTO transactions
        (amount, merchant_id, tag_id, description, currency_type, transaction_date)
      VALUES
        ($1, $2, $3, $4, $5, $6)
      RETURNING id
    "
    values = [@amount, @merchant_id, @tag_id, @description, @currency_type, @transaction_date]
    results = SqlRunner.run(sql, values)[0]
    @id = results['id'].to_i
  end

  def self.all()
    sql = "
      SELECT * FROM transactions
    "
    transactions = SqlRunner.run(sql)
    return self.map_items(transactions)
  end

  def self.map_items(transaction_data)
    result = transaction_data.map {|transaction| Transaction.new(transaction)}
    return result
  end

  def self.delete_all()
    sql = "
      DELETE FROM transactions
    "
    SqlRunner.run(sql)
  end

end
