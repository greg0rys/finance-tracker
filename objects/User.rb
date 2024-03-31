class User
  attr_accessor :name, :user_id, :admin, :num_bills, :num_accounts,:bills

  public
  def initialize(name, user_id, admin, num_accounts)
  @name         = name
  @user_id      = user_id
  @admin        = admin
  @num_accounts = num_accounts
  @bills        = {} # use :keys and not strings for the keys of the hash - then access using h[:k]
  @accounts     = {}
end


  # add a bill to the hash
  def insert_bill(new_bill)
    @bills[new_bill.id] = new_bill unless @bills.nil?
    @bills = {new_bill.id => new_bill}
  end

  # delete a bill of a given ID if the key isn't there return false
  def delete_bill(bill_id)
    @bills.delete(bill_id) unless @bills.has_key?(bill_id)
    false
  end

  # return a bill object for a given Id; Later this will have an array of options at each key
  def get_bill(bill_id)
    @bills[bill_id] unless @bills.has_key?(bill_id)
    nil
  end

  # get the total number of bills unless the hash is nil then return 0
  def get_bill_count
    @bills.length unless @bills === nil
    0
  end

=begin
 set all fields to nil so this object is not holding any memory while waiting for the collector
=end
  def free
    _freeSelf
  end


  private
  def _freeSelf
    @name = @user_id = @admin = @num_accounts = @bills = @accounts = nil
  end

end