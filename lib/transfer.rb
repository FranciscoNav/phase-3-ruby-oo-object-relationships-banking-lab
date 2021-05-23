require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount, status = 'pending')
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid? 
    if self.receiver.valid? && self.sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    transfer_amount = self.amount

    if self.status == 'pending'
      if valid? && self.sender.balance >= transfer_amount
        self.receiver.balance = self.receiver.balance + transfer_amount
        self.sender.balance = self.sender.balance - transfer_amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      "Transfer already complete " 
    end

  end

  def reverse_transfer
    transfer_amount = self.amount
    if self.status == "complete"
      self.status = "reversed"
      self.receiver.balance = self.receiver.balance - transfer_amount
      self.sender.balance = self.sender.balance + transfer_amount
    end
  end




end
