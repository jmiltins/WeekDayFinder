//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by janis.miltins on 14/11/2021.
//

import UIKit

class ViewController: UIViewController {
//Outlets
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
// Action
    @IBAction func findButtonTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        // Check, is there data in text fields
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else{
            // Alert f-tion
            warningAlert(withTitle: "Input Error", withMessage: "Text Fields can't be empty.")
            return
        }
        // put in dateComponents
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else {return}
        // date formater
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "en_EN")// lv_LV, ru_RU
        dateFormater.dateFormat = "EEEE" // Full name = Tuesday, f.exs
        
        // calculation
        switch findButton.titleLabel?.text{
        case "FIND":
            findButton.setTitle("CLEAR", for: .normal) // for is the styling
            if day >= 1 && day <= 31 && month >= 1 && month <= 12{
                let weekday = dateFormater.string(from: date)
                resultLable.text = weekday.capitalized // .capitalized for fitst Cap letter
            }else{
                warningAlert(withTitle: "Error!", withMessage: "Wrong Date, please enter the correst Date!")
            }
        default:
            findButton.setTitle("FIND", for: .normal) // for is the styling
            //clear
            clearTextFields()
        }
        
        func clearTextFields(){
            dayTextField.text = ""
            monthTextField.text = ""
            yearTextField.text = ""
            resultLable.text = "Press Find To Search for Your Day"
        }
        
    }
    // this f-tion opens text box withTitle and message, allows to close with ok
    func warningAlert(withTitle title: String?, withMessage message: String?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .destructive, handler: nil)//.destructive - red color
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    // to dismiss the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "day"{
            
        
        // Get the new view controller using segue.destination.
            let vc = segue.destination as! infoViewController
        // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps you to find weekday for given date."
        }
    }


    
    
    
}

