//
//  ResultViewController.swift
//  FocusCountDown
//
//  Created by ST1 on 4.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (results.count == 0) {
        resultView.text = "Awasome"
        } else {
        var str = ""
        for (ind,result) in results.enumerated() {
            //print(ind,result)
            str += "\n" + String(ind+1) + "-) \(result) second"
            
        }
        resultView.text = str
    }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
