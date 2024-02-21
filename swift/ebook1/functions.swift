import UIKit

func printText() {
    print("Functioin was called")
}

func returnPrintTextFunction() -> () -> Void {
    return printText;
}

let newFunctionInLet = returnPrintTextFunction()
newFunctionInLet()

func generateWallet(walletLength: Int) -> [Int] {
    let typesOfBanknotes = [50, 100, 500, 1000, 5000]
    var wallet: [Int] = []
    for _ in 1...walletLength {
        wallet.append(typesOfBanknotes.randomElement()!)
    }
    return wallet
}

func sumWallet(banknotesFuncton wallet: (Int) -> [Int],
               walletLength: Int )-> Int? {
    // call the passed wallet function
    let myWalletArrya = wallet( walletLength)
    var sum: Int = 0
    for oneBanknote in myWalletArrya {
        sum += oneBanknote
    }
    return sum
}

sumWallet(banknotesFuncton: generateWallet, walletLength: 20)
