//
//  ViewController.swift
//  AlarmAccountability
//
//  Created by Alexis Rodriguez on 5/1/23.
//

import UIKit

class AlarmListViewController: UIViewController {
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AlarmCell.self, forCellWithReuseIdentifier: "AlarmCell")
        return cv
    }()
    var alarms: [Alarm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarms = fetchData()
        title = "Alarm"
        collectionView.backgroundColor = UIColor(red: 11/255, green: 36/255, blue: 71/255, alpha: 1.0)
        configureCollectionView()
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension AlarmListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as! AlarmCell
        let alarm = alarms[indexPath.row]
        cell.set(alarm: alarm)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - (23 * 2), height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(alarms[indexPath.row].time) was pressed.")
        let alarmDetailsController = AlarmDetailsViewController()
        alarmDetailsController.time = alarms[indexPath.row].time
        alarmDetailsController.descript = alarms[indexPath.row].description
        self.navigationController?.present(alarmDetailsController, animated: true)
    }
    
}

extension AlarmListViewController {
    func fetchData() -> [Alarm] {
        let alarm1 = Alarm(time: "7:30 AM", description: "A couple more minutes")
        let alarm2 = Alarm(time: "11:30 AM", description: "Prepare Lunch")
        let alarm3 = Alarm(time: "5:30 PM", description: "Feed Felix")
        let alarm4 = Alarm(time: "7:30 PM", description: "Turn the lights on for Felix")
        let alarm5 = Alarm(time: "8:30 PM", description: "Bring Felix inside")
        let alarm6 = Alarm(time: "11:30 PM", description: "Time to unwind")
        let alarm7 = Alarm(time: "12:30 AM", description: "Are you in bed?")
        let alarm8 = Alarm(time: "1:00 AM", description: "Are you in bed?")
        let alarm9 = Alarm(time: "3:00 AM", description: "YOU BETTER BE IN BED!")
        let alarm10 = Alarm(time: "4:00 AM", description: "Are you working on a project? Probably working hella hard on something - hyperfocus mode")
        return [alarm1, alarm2, alarm3, alarm4, alarm5, alarm6, alarm7, alarm8, alarm9, alarm10]
    }
    
}

//struct Colors {
//    let collectionbackgroundColor = UIColor(red: 11/255, green: 36/255, blue: 71/255, alpha: 1.0)
//    let cellBackgroundColor = UIColor(red: 25/255, green: 55/255, blue: 109/255, alpha: 1.0)
//    let cellTimeTextColor = UIColor(red: 165/255, green: 215/255, blue: 232/255, alpha: 1.0)
//}
