# bank_tech_test
# Requirements
--------------
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).
--------------
# User Stories
As a user
So that I can add money to my account
I would like to make a deposit

As a user
So that I can remove money from my account
I would like to make a withdrawl

As a user
So that I can see my current activity
I would like to print my account statement (date, amount, balance)
--------------
Objects/Properties/Messages:
--------------
Objects (classes):
- account

Properties (instance variables):
- balance

Messages (methods):
- make a deposit
- make a withdrawl
- print my account statement

--------------
Input/Output Table
--------------

account = Account.new
=> Account[2D3C90820F598F2]
account.deposit(100)
=> nil
account.deposit(200)
=> nil
account.withdraw(150)
-> nil
account.view_statement
=> date || credit || debit || balance
8/2/21  ||  100   ||       ||   100
8/2/21  ||  200   ||       ||   300
8/2/21  ||        ||  150  ||   150
