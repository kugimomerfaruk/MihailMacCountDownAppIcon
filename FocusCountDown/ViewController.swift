//
//  ViewController.swift
//  FocusCountDown
//
//  Created by ST1 on 3.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit
var results = [Int] ()


class ViewController: UIViewController {
    var second : Int = 0
    var timer = Timer()
    var counter : Int = 0
    @IBOutlet weak var circleViewContainer: UIImageView!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var progressBarOutlet: UIProgressView!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var actionViewOutlet: UIView!
    @IBOutlet weak var touchTheScreenLabel: UILabel!
    @IBOutlet weak var pleaseEnterValue: UILabel!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        countDownLabel.text = String(Int(sender.value))
        second = Int(countDownLabel.text!)!
        //print(second)
        //print(stepperOutlet.value)
        progressBarOutlet.progress = 1
        progressBarOutlet.progressTintColor = UIColor(colorLiteralRed: 253/255.0, green: 111/255.0, blue: 113/255.0, alpha: 1)
        results.removeAll()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //print("Ekrana Dokundun")
        
        if Int(countDownLabel.text!)! == 0 {
           pleaseEnterValue.isHidden = false
            return
            
        }
        counter = Int(countDownLabel.text!)!
        progressBarOutlet.progressTintColor = UIColor.white
        progressBarOutlet.backgroundColor = UIColor.clear
        view.backgroundColor = UIColor(displayP3Red: 249/255.0, green: 150/255.0, blue: 123/255.0, alpha: 1)
        actionViewOutlet.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.timerFunc)), userInfo: nil, repeats: true)
        circleViewContainer.isHidden = false
        countDownLabel.textColor = UIColor(colorLiteralRed: 50/255.0, green: 60/255.0, blue: 76/255.0, alpha: 1)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //print("Elini Çektin")
        timer.invalidate()
        actionViewOutlet.isHidden = false
        view.backgroundColor = UIColor(colorLiteralRed: 50/255.0, green: 60/255.0, blue: 76/255.0, alpha: 1)
        circleViewContainer.isHidden = true
        stepperOutlet.value = Double(countDownLabel.text!)!
        countDownLabel.textColor = UIColor.white
        print(results.count)
        
        if results.count == 0 && ((Int(counter)) - Int(second))  == 0 {
            
        } else {
            if results.count >= 1 {
                if ((Int(counter)) - Int(second))  == 0{
                } else {
                    results.append(counter - second)}
            } else {
                results.append(counter - second)
                
            }
        }
        
        
        
        
        //print(countDownLabel.text!)
        //print(Int(results.last!))
        //print(results)
    }
    
    func timerFunc() {
        
        //print("Çalışıyor")
        if second <= 0 {
            timer.invalidate()
            second = 0
            print("Harika Tamamladınız")
            view.backgroundColor = UIColor.white
            actionViewOutlet.isHidden = false
            stepperOutlet.value = 0
            
            // Changing View
            /* 
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ResultView") as! ResultViewController
            self.present(resultViewController, animated:true, completion:nil)
            */
            // Changing View Finish
            performSegue(withIdentifier: "third", sender: self)
            return
            //timer Durdur
            
        } else {
            
            second -= 1
            countDownLabel.text! = String(second)
            let minus = (1 / stepperOutlet.value)
            progressBarOutlet.progress -= Float(minus)
            progressBarOutlet.progressTintColor = UIColor.white
            progressBarOutlet.backgroundColor = UIColor.clear
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = String(second)
        view.backgroundColor = UIColor(colorLiteralRed: 50/255.0, green: 60/255.0, blue: 76/255.0, alpha: 1)
        circleViewContainer.isHidden = true
        pleaseEnterValue.isHidden = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

