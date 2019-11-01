//
//  APIViewController.swift
//  BMICalculator
//
//  Created by Cody Tavenner on 6/29/19.
//  Copyright © 2019 Cody Tavenner. All rights reserved.
//

import UIKit
import SafariServices

class APIViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var message: UILabel!
    var urlString = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    struct BMIResults:Decodable
    {
        let bmi:Double
        let more:[String]
        let risk:String
    }
    
    @IBAction func BMICall(_ sender: UIButton) {
        let h = height.text!
        let w = weight.text!
        
        let urlAsString = "http://webstrar99.fulton.asu.edu/page3/Service1.svc/calculateBMI?height=\(h)&weight=\(w)"
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            let decoder = JSONDecoder()
            let jsonResult = try!decoder.decode(BMIResults.self, from: data!)
            
            let b = jsonResult.bmi
            let m = jsonResult.more
            let r = jsonResult.risk
            
            self.urlString = m[0]
            
            DispatchQueue.main.async{
                self.bmi.text = String(b)
                self.message.text = r
                if b < 18
                {
                    self.message.textColor = UIColor.blue
                }
                else if b >= 18 && b < 25
                {
                    self.message.textColor = UIColor.green
                }
                else if b >= 25 && b <= 30
                {
                    self.message.textColor = UIColor.purple
                }
                else if b > 30
                {
                    self.message.textColor = UIColor.red
                }
                
                }
            })
            
            jsonQuery.resume()
        }
        
    
    
    @IBAction func Educate(_ sender: UIButton) {
        
        if let url = URL(string: urlString)
        {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            present(vc, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool){
        if didLoadSuccessfully == false
        {
            print("Page did not load!")
            controller.dismiss(animated: true, completion: nil)
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
