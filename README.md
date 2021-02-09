# bank_tech_test
--------------
# Instructions for running the project, dependencies and tests:
- Add the following to your gemfile:
    group :test do
    gem 'rspec'
    gem 'rubocop'
    gem 'simplecov', require: false, group: :test
    gem 'simplecov-console', require: false, group: :test
    end
- run 'bundle install' from the command line
- run 'rspec' for unit tests and 'rubocop' for linting.
- The project can be functionally run in any repl such as irb.
--------------
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
- transaction

Properties (instance variables):
- balance
- history

Messages (methods):
- make a deposit
- make a withdrawl
- print my account statement
- get the date

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

-------------------
# Initial Plan

My plan was to break down the problem into extremely small problems. This is a technique which I need to improve in, especially when I am unsure as to how to achieve the final product. This was a good example of that. I knew roughly how to set up my account class, with it's 
withdraw and deposit methods, and equally how to test for them. I used irb to ensure that my logic was guiding me down the right path.

Once the Account class became to clunky with transaction instance variables, I extracted this to a separate class and gave my attempt at testing account in isolation.
--------------------
# Below is a screenshot of my working Bank Account application. 

--------------------
