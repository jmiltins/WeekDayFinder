//
//  infoViewController.swift
//  WeekDayFinder
//
//  Created by janis.miltins on 16/11/2021.
//

import UIKit

class infoViewController: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !infoText.isEmpty{
            appDescLabel.text = infoText
        }

        // Do any additional setup after loading the view.
    }
    

}
