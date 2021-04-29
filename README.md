Edinburgh Napier University, Advanced Database Systems module coursework. Developed using OracleSQL (PL/SQL).

# Specification

## Scenario
"A bank has several branches in the UK. It needs a database to store information about its local branches. Each branch is identified by a unique branch code, an address (street, city, post code), and a phone number. The customer accounts at each branch are also recorded.

Each customer account is identified by a unique account number, an account type (current or savings), and a balance. Each account has an interest rate (interest rate can be determined by yourself - any reasonable one will be fine). An account is also associated with exactly one branch. The date when the account is opened is recorded as well. An account must be classified as either a current or a savings account (but not both). A current account also has a limit of free overdraft (overdraft can be determined by yourself - any reasonable one will be fine). The free overdraft limit is set at the opening of an account.

Data about customers and employees is also recorded. All customers and employees have an associated National Insurance number (a tax payer’s unique identification number), address (street, city, post code) and phone numbers (home number and mobile numbers). An employee cannot be a customer at the same branch where he/she works. An employee has a job position (Head, Manager, Project Leader, Accountant, Cashier) and a salary, and works for exactly one branch. The date that the employee joined the bank is also recorded. Every employee has a supervisor at the same branch, except the head of the branch. The supervisor is either the head, a manager or a team leader. The head of the branch is the only person who is not supervised by anyone at the same branch. A customer may have multiple accounts with the bank, and an account may be owned by multiple customers as a joint account."

## Additional Queries Task
1. Find employees whose first name includes the string “st” and live in Glasgow, displaying their full names.
2. Find the number of saving accounts at each branch, displaying the number and the branch’s address.
3. At each branch, find customers who have the highest balance in their savings account, displaying the branch address, their names, and the balance.
4. Find employees who are supervised by a manager and have accounts in the bank, displaying the branch address that the employee works in and the branch address that the account is opened with.
5. At each branch, find customers who have the highest free overdraft limit in all current accounts that are joint accounts, displaying the branch’s ID, the customer’s full names, the free overdraft limit in his/her current account.
6. Find customers who have more than one mobile, and at least one of the numbers starts with 0760, displaying the customer’s full name and mobile numbers. COLLECTIONS must be used.
7. Find the number of employees who are supervised by Mr Smith, who is supervised by Mrs Jones. REFERENCES must be used.
8. Award employees at the end of a year: gold medals for employees who have been working at the bank for more than 10 years and supervised more than 8 staff; silver medals for employees who have been working at the bank for more than 8 years and supervised more than 5 staff; bronze medals for employees who have been working at the bank for more than 4 years. Displaying winners’ names and Medal awarded (only displaying those who have been awarded). METHODS must be used.
