//
//  ViewController.swift
//  Calculator
//
//  Created by Upadhyay, Priyanka on 2/7/17.
//  Copyright © 2017 Upadhyay, Priyanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumText = ""
    var secondNumText = ""
    var op = ""
    var isFirstnum = true
    var hasOp = false
    var canClear = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    @IBAction func handleButtonPress(_ sender: UIButton) {
        
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        
        let currentText = resultLabel.text!
        let textLabel = (sender as AnyObject).titleLabel??.text
        if let text = textLabel {
            switch text {
                case "+", "-", "*", "/":
                    if hasOp {
                        return
                }
                
                op = text
                isFirstnum = false
                hasOp = true
                resultLabel.text = "\(currentText)\(op)"
                break
                
                case "=":
                isFirstnum = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultLabel.text = "\(result)"
                break
            default:
                if isFirstnum {
                    firstNumText = "\(firstNumText)\(text)"
                } else {
                    secondNumText = "\(secondNumText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
        
    }
        
        
    func calculate() -> Double {
        let firstNum = Double(firstNumText)!
        let secondNum = Double(secondNumText)!
        firstNumText = ""
        secondNumText = ""
        switch op {
        case "+":
            return firstNum + secondNum
        case "-":
            return firstNum - secondNum
        case "*":
            return firstNum * secondNum
        case "/":
            return firstNum / secondNum
        default:
            return 0
        }

    }
}

