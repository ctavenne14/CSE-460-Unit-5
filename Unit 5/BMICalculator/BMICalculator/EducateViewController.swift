//
//  EducateViewController.swift
//  BMICalculator
//
//  Created by Cody Tavenner on 6/29/19.
//  Copyright © 2019 Cody Tavenner. All rights reserved.
//

import UIKit


class EducateViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func CalcBMI(_ sender: UIButton) {
        let h = height.text!
        let w = weight.text!
        
        let calc = Double(w)!/(Double(h)!*Double(h)!)*703
        
        bmi.text = String(calc)
        
        if calc < 18
        {
            message.text = "You are underweight if BMI is < 18"
            message.textColor = UIColor.blue
        }
        else if calc >= 18 && calc < 25
        {
            message.text = "You are normal if BMI is ≥ 18 and < 25"
            message.textColor = UIColor.green
        }
        else if calc >= 25 && calc <= 30
        {
            message.text = "You are pre-obese if BMI is between 25 and 30"
            message.textColor = UIColor.purple
        }
        else if calc > 30
        {
            message.text = "You are obese if BMI is greater than 30"
            message.textColor = UIColor.red
        }


    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
