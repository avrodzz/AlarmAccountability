//
//  ViewController.swift
//  AlarmAccountability
//
//  Created by Alexis Rodriguez on 5/1/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var editAlarmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editAlarmButton.layer.cornerRadius = 10.0
        editAlarmButton.configuration!.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
    }
    
    @IBAction func editAlarmButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToEditAlarmPage", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToEditAlarmPage" {
            //let destinationVC = segue.destination as! EditAlarmViewController
        }
    }


}

