//
//  AppearanceViewController.swift
//  WeekDayFinder
//
//  Created by janis.miltins on 16/11/2021.
//

import UIKit

class AppearanceViewController: UIViewController {
    @IBOutlet weak var textLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openSettingsButtonTapped(_ sender: Any) {
        openSettings()
    }
    func setLabelText(){
        var text = "Unable to specify UI style"
        if self.traitCollection.userInterfaceStyle == .dark{
            text = "Dark Mode is On.\nGo to settings if you would like \ntochange to Light Mode"
        }else{
            text = "Light Mode is On.\nGo to settings if you would like \ntochange to Dark Mode"
        }
        textLable.text = text        
    }
        func openSettings(){
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
            if UIApplication.shared.canOpenURL(settingsURL){
                UIApplication.shared.open(settingsURL, options: [:]) {
                    success in
                    print("open: ", success)
                
            }
        }
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        // to dismiss te view
        self.dismiss(animated: true, completion: nil)
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
extension AppearanceViewController{
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
    
}
