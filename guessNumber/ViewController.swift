//
//  ViewController.swift
//  guessNumber
//
//  Created by Bernice TSAI on 2020/8/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var announceLabel: UILabel!
    @IBOutlet weak var enterText: UITextField!
    var mindNumber: Int = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder();
    return true
    }
    //calculate the digitsum of one integer
    func digitSum(_ n : Int) -> Int {
        return sequence(state: n) { (n: inout Int) -> Int? in
                defer { n /= 10 }
                return n > 0 ? n % 10 : nil
            }.reduce(0, +)
    }
    func clear(){
        enterText.text = " "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func readYourMind(_ sender: UIButton) {
        
        let number = Int(enterText.text!)
        mindNumber = ((number!*10+((digitSum(number!)/9)+1)*9 - digitSum(number!)))/9
        clear()
        textFieldShouldReturn(enterText)
        announceLabel.text = "你心中所想數字是:\n \(mindNumber)"
    }
    
    
}

