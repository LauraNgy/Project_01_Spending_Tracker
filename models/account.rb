require_relative('../db/sql_runner')

class Account

  attr_accessor :id, :currency, :budget, :spending_limit

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @currency = params['currency']
    @budget = params['budget'].to_f
    @spending_limit = params['spending_limit'].to_f
  end

  def save()
    sql = "
      INSERT INTO accounts
        (currency, budget, spending_limit)
      VALUES
        ($1, $2, $3)
      RETURNING id
    "
    values = [@currency, @budget, @spending_limit]
    results = SqlRunner.run(sql, values)[0]
    @id = results['id'].to_i
  end

  def update()
    sql = "
      UPDATE accounts
      SET
        (currency, budget, spending_limit)
        =
        ($1, $2, $3)
      WHERE
        id = $4
    "
    values = [@currency, @budget, @spending_limit, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "
    SELECT * FROM accounts
    "
    tags= SqlRunner.run(sql)
    return self.map_items(tags)
  end

  def self.find(id)
    sql = "
      SELECT * FROM accounts
      WHERE
        id = $1
    "
    values = [id]
    account = SqlRunner.run(sql, values)[0]
    result = Account.new(account)
    return result
  end

  def self.map_items(account_data)
    result = account_data.map {|account| Account.new(account)}
    return result
  end

  def self.delete(id)
    sql = "
      DELETE FROM accounts
      WHERE
        id = $1
    "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "
      DELETE FROM accounts
    "
    SqlRunner.run(sql)
  end

end
