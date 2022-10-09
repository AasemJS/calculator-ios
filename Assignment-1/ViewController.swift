//  ViewController.swift
//
//  Calculator 2 - A simple calculator app
//  V 1.0
//  Design created by Group 25
//  on 05 October 2022
//
//  Group Members
//  Murtuza Haider Naqvi- 301289355
//  Asem Javed Syed - 301274803
//  Dhanush Sriram - 301299251

import UIKit

class ViewController: UIViewController {
    
    //function to display result
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //function for numbers buttons
    @IBAction func numberBtn(_ sender: UIButton) {
        
        let button = sender as UIButton
        let buttonText = button.titleLabel!.text
        
        switch (buttonText) {
        case ("."):
            if(!resultLabel.text!.contains(".")){
                resultLabel.text?.append(buttonText!)
            }
        default:
            if(resultLabel.text == "0"){
                resultLabel.text = buttonText
            }
            else{
                resultLabel.text?.append(buttonText!)
            }
        }
    }
    
    // function for operators
    @IBAction func operatorBtn(_ sender: UIButton) {
        let operation = sender as UIButton
        let operationText = operation.titleLabel!.text
        
        switch (operationText) {
        case ("="):
            if(!resultLabel.text!.contains("=")){
                if let str = resultLabel.text{
                    resultLabel.text = doCalculation(x: str)
                }
            }
        default:
            if(resultLabel.text == "0"){
                resultLabel.text = "0"
            }
            else{
                resultLabel.text?.append(operationText!)
            }
        }
        
    }
    
    // function for clear and delete
    @IBAction func addOnBtn(_ sender: UIButton) {
        
        let delButton = sender as UIButton
        let delBtn = delButton.titleLabel!.text
        
        switch (delBtn) {
        case ("AC"):
            if (delBtn == "AC") {
                resultLabel.text = "0"
            }
        default:
            if(delBtn == "DEL"){
                let itemToRemove = resultLabel.text!.dropLast()
                print(itemToRemove)
                resultLabel.text = String(itemToRemove)
            }
            if(resultLabel.text!.isEmpty){
                resultLabel.text = "0"
            }
        }
    }
    
    // functions for calculationss
    func doCalculation(x: String) -> String{
        let operands:[Character] = ["+","-","X","/","%"]
        var lhs:String = ""
        var operand = [String]()
        var nums = [String]()

        for char in x{
            if operands.contains(char){
                operand.append(String(char))
                nums.append(lhs)
                lhs=""
            }
                
            else{
                lhs+=String(char)
            }
        }

        nums.append(lhs)
        
        return calcResult(numbers:nums,operands:operand)
    }
    
    func calcResult(numbers: [String], operands: [String]) -> String{
        var nums:[String] = numbers
        var opers:[String] = operands
        
        while(opers.count > 0){
        
            nums[0] = calculate(num1:nums[0],num2:nums[1],operand:opers[0])
            nums.remove(at: 1)
            opers.remove(at: 0)
        }
        
        return nums[0]
        
    }
    
    func calculate(num1:String,num2:String,operand:String) -> String{
        
        var res:Double = 0
        let n1 = Double(num1)
        let n2 = Double(num2)
        
        switch(operand) {
                case("+"):
                if let v1 = n1{
                    if let v2 = n2{
                        res = v1+v2
                    }
                }
                case("-"):
                if let v1 = n1{
                    if let v2 = n2{
                        res = v1-v2
                    }
                }
                case("X"):
                if let v1 = n1{
                    if let v2 = n2{
                        res = v1*v2
                    }
                }
                case("/"):
                if let v1 = n1{
                    if let v2 = n2{
                        res = v1/v2
                    }
                }
                case("%"):
                if let v1 = n1{
                    
                    res = v1/100
                    
                }
                default : res = 0
            }
        return String(res);
    }

    
}


