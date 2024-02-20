import UIKit

func printText() {
    print("Functioin was called")
}

func rturnPrintTextFunction() -> () -> Void {
    return printText;
}

let newFunctionInLet = returnPrintTextFunction()
