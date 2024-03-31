class User
  attr_accessor :name, :user_id, :admin, :num_bills, :num_accounts,:bills

  def initialize(name, user_id, admin, num_accounts)
  @name         = name
  @user_id      = user_id
  @admin        = admin
  @num_accounts = num_accounts
  @bills        = {} # use :keys and not strings for the keys of the hash - then access using h[:k]
  @accounts     = {}
end


  def insert_bill(new_bill)
    @bills[new_bill.id] = new_bill unless @bills.nil?
    @bills = {new_bill.id => new_bill}
  end

  def delete_bill(bill_id)
    @bills.delete(bill_id) unless @bills.has_key?(bill_id)
    false
  end

  def get_bill(bill_id)
    @bills[bill_id] unless @bills.has_key?(bill_id)
    nil
  end

  def get_bill_count
    @bills.length unless @bills === nil
    0
  end

end