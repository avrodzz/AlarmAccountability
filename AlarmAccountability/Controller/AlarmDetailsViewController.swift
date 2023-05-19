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
    var datePicker = UIDatePicker()
    let tableView = UITableView()
    var deleteAlarmButton = UIButton()
    
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
        view.addSubview(datePicker)
        view.addSubview(tableView)
        view.addSubview(deleteAlarmButton)
        
        configureTimeLabel()
        configureDescriptionLabel()
        configureDatePicker()
        configureTableView()
        configureDeleteButton()
        
        setTimeLabelConstraints()
        setDescriptionLabelConstraints()
        setDatePickerConstraints()
        setTableViewConstraints()
        setDeleteButtonConstraints()
    }
    
    func configureTimeLabel() {
        timeLabel.numberOfLines = 0
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        timeLabel.textColor = AlarmViewColors.cellTimeTextColor
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 1
        descriptionLabel.adjustsFontSizeToFitWidth = false
        descriptionLabel.textColor = AlarmViewColors.cellDescriptionTextColor
    }
    
    func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = AlarmViewColors.datePickerBackgroundColor
    }
    
    func configureTableView() {
        tableView.isScrollEnabled = false
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureDeleteButton() {
        deleteAlarmButton.setTitle("Delete", for: .normal)
        deleteAlarmButton.setTitleColor(UIColor.red, for: .normal)
        deleteAlarmButton.backgroundColor = AlarmViewColors.cellTimeTextColor
        deleteAlarmButton.layer.cornerRadius = 10
        deleteAlarmButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    @objc func pressed(_ sender: UIButton) {
        print("delete button has been pressed")
    }
    
    func setTimeLabelConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        timeLabel.textAlignment = .center
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.textAlignment = .center
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setDatePickerConstraints() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerYAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 150).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setDeleteButtonConstraints() {
        deleteAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        deleteAlarmButton.centerYAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 75).isActive = true
        deleteAlarmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        deleteAlarmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

extension AlarmDetailsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(named: "CellTimeTextColor")
        cell.selectionStyle = .none
        cell.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return cell
    }
}

extension AlarmDetailsViewController {
    func fetchData() -> [ActionButton] {
        let actionButton1 = ActionButton(title: "Repeat")
        let actionButton2 = ActionButton(title: "Label")
        let actionButton3 = ActionButton(title: "Sound")
        let actionButton4 = ActionButton(title: "Snooze")
        
        return [actionButton1, actionButton2, actionButton3, actionButton4]
    }
}
