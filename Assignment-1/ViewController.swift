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
}
