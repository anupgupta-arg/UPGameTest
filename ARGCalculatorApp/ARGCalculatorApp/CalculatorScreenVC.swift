//
//  CalculatorScreenVC.swift
//  ARGCalculatorApp
//
//  Created by Uniqolabel Developer on 25/12/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class CalculatorScreenVC: UIViewController {
    @IBOutlet weak var inputLabel: UILabel!
    
    var inputStr : String = "";
    var firstPartNo :String = ""
    var secondPartNo : String = "";
    var isFirstPart : Bool = true;
    var isSecondPart : Bool = false;
    var isDecimal : Bool = true;
    var operation : String = "";
    var result : String = ""
    var isOperatorAdded : Bool = true;
    var isMinus : Bool = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func inputButtonDigitButtonAction(_ sender: Any) {
        
        let buttonTag = (sender as AnyObject).tag
        MathematicsCalculation.getSingleton().enterDigit(oldstr: inputStr, buttonTag: buttonTag as AnyObject)
          isMinus = true
        switch buttonTag {
        case 0,1,2,3,4,5,6,7,8,9:
            print("buttonTag 1",buttonTag!)
            inputStr = "\(inputStr)\(buttonTag!)"
            inputLabel.text = inputStr
            
            if isFirstPart {
                firstPartNo = "\(firstPartNo)\(buttonTag!)"
            }else{

                secondPartNo = "\(secondPartNo)\(buttonTag!)"
            }
            print("firstPartNo",firstPartNo)
            print("secondPartNo",secondPartNo)
            
            
        case 10:
            print("buttonTag 10",buttonTag!)
            guard isDecimal else{
                return
            }
            isDecimal = false
            inputStr = "\(inputStr)."
            inputLabel.text = inputStr
            if isFirstPart {
               firstPartNo = "\(firstPartNo)."
                
            }else{
                secondPartNo = "\(secondPartNo)."
                
            }
            
        default:
            print("buttonTag default");
        }
        
    }
    
    @IBAction func calculationButtonAction(_ sender: Any) {
     
        let buttonTag = (sender as AnyObject).tag
        
        guard isOperatorAdded else {
            guard firstPartNo != "" && secondPartNo != "" else{
                return
            }
            let f : Double = Double(firstPartNo)!
            let s : Double =  Double(secondPartNo)!
            
            let result =  MathematicsCalculation.getSingleton().getResult(firstNumber: f, secondNumber: s, operation: operation)
            firstPartNo = result;
            secondPartNo = "";
            inputLabel.text = result
            inputStr = result
            isMinus = true
            mathmaticsOperaions(buttonTag:buttonTag!)
            print("added")
            return
        }
        
        mathmaticsOperaions(buttonTag:buttonTag!)
        
        
        
    }
    
    func mathmaticsOperaions(buttonTag : Int) {
        
        switch buttonTag {
            
        case 1:
            print("buttonTag +",buttonTag)
            guard inputStr != "" && isMinus else{
                return
            }
            inputStr = "\(inputStr) + "
            inputLabel.text = inputStr
                        inputLabel.text = inputStr
            if isFirstPart {
                isFirstPart = false
              

                
            }
            operation = "+"
            isOperatorAdded = false
        case 2:
            print("buttonTag -",buttonTag)
            operation = "-"
           
            isOperatorAdded = false
            guard isMinus else{
                return
            }
            inputStr = "\(inputStr) - "
            inputLabel.text = inputStr
            if firstPartNo == ""{
                firstPartNo = "-"
                isOperatorAdded = true
                 isMinus = false
//                inputStr = "\(inputStr) - "
//                inputLabel.text = inputStr
            }else{
                if isFirstPart {
                    isFirstPart = false
                   
//                    inputStr = "\(inputStr) - "
//                    inputLabel.text = inputStr
                    
                    
                }
                
            }
            
           
            
        case 3:
            print("buttonTag *",buttonTag)
            
            //            inputLabel.text = inputStr
            guard inputStr != "" && isMinus else{
                return
            }
            inputStr = "\(inputStr) * "
            inputLabel.text = inputStr
            if isFirstPart {
                isFirstPart = false
               
                
            }
            operation = "*"
            isOperatorAdded = false
            
        case 4:
            print("buttonTag /",buttonTag)
            guard inputStr != "" && isMinus else{
                return
            }
            inputStr = "\(inputStr) / "
            inputLabel.text = inputStr
            if isFirstPart {
                
                isFirstPart = false

                
            }
            operation = "/"
            isOperatorAdded = false
            
        default:
            print("buttonTag default");
            
        }
    }
    
    @IBAction func equalButtonAction(_ sender: Any) {
        print("this is equal Button");
        print("first part:",firstPartNo)
        print("second part:",secondPartNo)
        
        guard firstPartNo != "" && secondPartNo != "" else{
            return
        }
        let f : Double = Double(firstPartNo)!
        let s : Double =  Double(secondPartNo)!
        
      let result =  MathematicsCalculation.getSingleton().getResult(firstNumber: f, secondNumber: s, operation: operation)
        
      inputLabel.text = result
        
        
        inputStr = result;
        isFirstPart = true
        firstPartNo = result;
        secondPartNo = "";
        isDecimal = true;
        isOperatorAdded = true
        isMinus = true
    }
    @IBAction func clearButtonAction(_ sender: Any) {
        inputStr = "";
        inputLabel.text = "0"
        isFirstPart = true
        firstPartNo = "";
        secondPartNo = "";
        isDecimal = true;
        isOperatorAdded = true
        isMinus = true
    }
    
    
    @IBAction func BackButtonAction(_ sender: Any) {
        
        
    }
    
    
    
    
}
