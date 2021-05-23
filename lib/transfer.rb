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

    # if self.sender.valid?
    #   self.receiver.balance = self.receiver.balance + transfer_amount
    #   self.sender.balance = self.sender.balance - transfer_amount
    #   self.status = "complete"
    # else
    #   "Transaction rejected. Please check your account balance."
    # end

    if self.sender.balance > transfer_amount
      self.receiver.balance = self.receiver.balance + transfer_amount
      self.sender.balance = self.sender.balance - transfer_amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    #no arguments
  end




end
