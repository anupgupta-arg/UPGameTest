//
//  MathematicsCalculation.swift
//  ARGCalculatorApp
//
//  Created by Uniqolabel Developer on 25/12/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import Foundation


class MathematicsCalculation: NSObject {
    private static var _instance: MathematicsCalculation?;
    
    private override init() {
        
    }
    
    public static func getSingleton() -> MathematicsCalculation {
        if (MathematicsCalculation._instance == nil) {
            MathematicsCalculation._instance = MathematicsCalculation.init();
        }
        return MathematicsCalculation._instance!;
}

    func enterDigit(oldstr: String , buttonTag : AnyObject) {
        
    }
    
    func enterSymbol(oldstr: String , buttonTag : AnyObject) {
        
    }

    
    func getResult( firstNumber : Double, secondNumber : Double, operation : String) -> String {
        
        switch operation {
        case "+":
            print("add")
            var re = firstNumber + secondNumber
            print("result",re)
            
             re = re.roundToDecimal(3)
            
          return"\(re.clean)"
        case "-":
            print("sub")
            var re = firstNumber - secondNumber
            print("result",re)
             re = re.roundToDecimal(3)
            return"\(re.clean)"
        case "*":
            print("multi")
            var re = firstNumber * secondNumber
             re = re.roundToDecimal(3)
            print("result",re)
           return"\(re.clean)"
        case "/":
            print("devide")
            var re = firstNumber / secondNumber
             re = re.roundToDecimal(3)
            print("result",re)
          return"\(re.clean)"
        default:
            print("default")
            return "ERROR"
        }
        
        
    }
    
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
   
        var clean: String {
           return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
        }
    
}
