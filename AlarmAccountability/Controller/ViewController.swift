//
//  ViewController.swift
//  AlarmAccountability
//
//  Created by Alexis Rodriguez on 5/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var alarms: [Alarm] = []
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarms = fetchData()
        title = "Alarm"
        collectionView.backgroundColor = UIColor(red: 11/255, green: 36/255, blue: 71/255, alpha: 1.0)
        configureCollectionView()
//        configureTableView()
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
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
//        tableView.contentInset = UIEdgeInsets(top: 100,left: 0,bottom: 0,right: 0)
        
        //set delegates
//        setTableViewDelegates()
        
        //set row height
        tableView.rowHeight = 120
        
        //register cells
        tableView.register(AlarmCell.self, forCellReuseIdentifier: "AlarmCell")
        
        //set constraints
        tableView.pin(to: view)
    }
    
//    func setTableViewDelegates() {
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return alarms.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell") as! AlarmCell
//        let alarm = alarms[indexPath.row]
//        cell.set(alarm: alarm)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(alarms[indexPath.row].time) has been pressed")
//    }
//}

//extension CALayer {
//  func applySketchShadow(
//    color: UIColor = .black,
//    alpha: Float = 0.5,
//    x: CGFloat = 0,
//    y: CGFloat = 2,
//    blur: CGFloat = 4,
//    spread: CGFloat = 0)
//  {
//    masksToBounds = false
//    shadowColor = color.cgColor
//    shadowOpacity = alpha
//    shadowOffset = CGSize(width: x, height: y)
//    shadowRadius = blur / 2.0
//    if spread == 0 {
//      shadowPath = nil
//    } else {
//      let dx = -spread
//      let rect = bounds.insetBy(dx: dx, dy: dx)
//      shadowPath = UIBezierPath(rect: rect).cgPath
//    }
//  }
//}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as! AlarmCell
        let alarm = alarms[indexPath.row]
        cell.set(alarm: alarm)
//        cell.layer.applySketchShadow(color: UIColor.black, alpha: 0.25, x: 2, y: 6, blur: 4, spread: 0)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - (23*2), height: 120)
    }
}

extension ViewController {
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
