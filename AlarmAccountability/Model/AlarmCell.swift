//
//  AlarmCell.swift
//  AlarmAccountability
//
//  Created by Alexis Rodriguez on 5/16/23.
//

import UIKit

class AlarmCell: UICollectionViewCell {
    var timeLabel = UILabel()
    var descriptionLabel = UILabel()
    var alarmToggle = UISwitch()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 25/255, green: 55/255, blue: 109/255, alpha: 1.0)
        
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(timeLabel)
        addSubview(descriptionLabel)
        addSubview(alarmToggle)
        
        configureTimeLabel()
        configureDescriptionLabel()
        configureAlarmToggle()
        
        setTimeLabelConstraints()
        setDescriptionLabelConstraints()
        setAlarmToggleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(alarm: Alarm) {
        timeLabel.text = alarm.time
        descriptionLabel.text = alarm.description
    }
    
    func configureTimeLabel() {
        timeLabel.numberOfLines = 0
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        timeLabel.textColor = UIColor(red: 165/255, green: 215/255, blue: 232/255, alpha: 1.0)
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 1
        descriptionLabel.adjustsFontSizeToFitWidth = false
//        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.textColor = UIColor.white
    }
    
    func configureAlarmToggle() {
        alarmToggle.isSelected = false
    }
    
    func setTimeLabelConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 133).isActive = true
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 253).isActive = true
    }
    
    func setAlarmToggleConstraints() {
        alarmToggle.translatesAutoresizingMaskIntoConstraints = false
        alarmToggle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        alarmToggle.heightAnchor.constraint(equalToConstant: 31).isActive = true
        alarmToggle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
