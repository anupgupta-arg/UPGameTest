//
//  ViewController.swift
//  AMCalculatorSampleApp
//
//  Created by Uniqolabel Developer on 28/12/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit
import AMCalculatorTextField

class ViewController: UIViewController,AMCalculatorTextFieldDelegate {
    
    var calculator : CalculatorScreenVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func openCalculatorButtonAction(_ sender: Any) {
        
        let storyboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle(for: CalculatorScreenVC.classForCoder()));
        
        let vc = storyboard.instantiateViewController(withIdentifier: "CalculatorScreenVCID") as! CalculatorScreenVC
        vc.AMCalculatorDelegate = self;
        
        self.present(vc, animated: true) {
            self.calculator = vc;
        }
        
    }
    
    func onBackPressed() {
        print("OnBackPressed")
        calculator?.dismiss(animated: true, completion: {
            self.calculator = nil;
        })
    }
}

