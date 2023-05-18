//
//  AlarmDetailsViewController.swift
//  AlarmAccountability
//
//  Created by Alexis Rodriguez on 5/17/23.
//

import UIKit

class AlarmDetailsViewController: UIViewController {
    var time: String?
    var descript: String?
    var timeLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AlarmViewColors.collectionbackgroundColor
        if let validTimeText = time {
            timeLabel.text = validTimeText
        }
        if let validDescriptionText = descript {
            descriptionLabel.text = validDescriptionText
        }
        
        view.addSubview(timeLabel)
        view.addSubview(descriptionLabel)
        
        configureTimeLabel()
        configureDescriptionLabel()
        
        setTimeLabelConstraints()
        setDescriptionLabelConstraints()
    }
    
    func configureTimeLabel() {
        timeLabel.numberOfLines = 0
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        timeLabel.textColor = AlarmViewColors.cellTimeTextColor
    }
    
    func setTimeLabelConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 133).isActive = true
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 1
        descriptionLabel.adjustsFontSizeToFitWidth = false
        descriptionLabel.textColor = AlarmViewColors.cellDescriptionTextColor
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 253).isActive = true
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
