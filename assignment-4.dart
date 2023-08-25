abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: $amount');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: $amount');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance -= amount;
      print('Withdrawn: $amount');
    } else {
      print('Insufficient funds');
    }
  }
}

void main() {
  var savingsAccount = SavingsAccount(123456, 1000.0, 0.05);
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(200.0);

  var currentAccount = CurrentAccount(654321, 2000.0, 1000.0);
  currentAccount.deposit(800.0);
  currentAccount.withdraw(3000.0);
}
