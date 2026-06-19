# =============================================================================
# Phase 2 — The AI Audit: Bank Account
#
# This script was "written by AI." It has exactly 5 mistakes:
#   - 2 syntax errors  (Ruby won't even run until these are fixed)
#   - 3 logic flaws    (Ruby runs but produces wrong results)
#
# Your job: find all 5, add a comment above each bug, then fix them.
# Use this format for your comments:
#   # BUG [n]: [what is wrong] → FIX: [what it should be]
# =============================================================================

class BankAccount
  attr_reader :balance, :owner

  def initialize(owner, initial_balance)
    @owner   = owner
    @balance = initial_balance
    @rate    = 0.05
  end

  def deposit(amount)
    if amount > 0
      @balance += amount # first logical error should be + not -
      puts "  New balance: $#{"%.2f" % @balance}"
    else
      puts "  Error: Deposit amount must be positive."
    end
  end

  def withdraw(amount)
    if amount > balance
      puts "Your balance is insufficient !!!"
      return
    end
    # third logical error is that the amount can be greater than the balance
    @balance -= amount
    puts "  New balance: $#{"%.2f" % @balance}"
  end # BUG [2]: [method didn't have end keyword] → FIX: [added end keyword]

  def apply_interest
    @balance += @balance * @rate # second logical error as the interest should be deducted from the balance
    puts "  New balance: $#{"%.2f" % @balance}"
  end

  def display_info
    puts "Owner  : #{@owner}"
    puts "Balance: $#{@balance}" # BUG [1]: [the curly brackets didn't match] → FIX: [should be {}]
  end
end

# --- Script entry point ---

account = BankAccount.new("Alice", 1000)

puts "=== Account Info ==="
account.display_info
puts

puts "Depositing $500..."
account.deposit(500)
puts

puts "Withdrawing $200..."
account.withdraw(200)
puts

puts "Applying 5% interest..."
account.apply_interest
puts

puts "Attempting to overdraw $2000..."
account.withdraw(2000)
puts
account.display_info
