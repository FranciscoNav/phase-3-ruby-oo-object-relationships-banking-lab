require 'pry'

class BankAccount
    attr_reader :name
    attr_accessor :status, :balance

    def initialize(name,status='open')
        @name = name  
        @balance = 1000
        @status = status
    end

    def deposit(amount)
        self.balance = self.balance + amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end
    
    def valid? 
        if self.balance > 0 && self.status == 'open'
            true
        else
            false
        end
    end
    
    def close_account
        self.status = "closed"
    end

end
