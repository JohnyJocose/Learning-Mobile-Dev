//
//  ViewController.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an extensive exploration of UIDatePickers, a crucial component in iOS development for selecting dates and times. The file presents a UITableView featuring a variety of date picker configurations, offering users a glimpse of the available options and their diverse use cases. From date selection to time scheduling, UIDatePickers play a pivotal role in enhancing user interactions and facilitating accurate temporal inputs. This file serves as a comprehensive reference for developers seeking to understand, configure, and effectively implement UIDatePickers within their iOS applications.

// This file is simply the table view that will lead to the date picker, so no code related to it is in this one. Any other questions you have about the stuff you see in this file can be found in other projects in the repository.

class ViewController: UIViewController {
    
    let datePickerTable = UITableView()
    let headerTitles = ["Wheels", "Compact", "Inline"]
    
    
    let fileNames: [[UIViewController]] = [
        [WheelsTimeVC(),
        WheelsDateVC(),
        WheelsDateTimeVC(),
        WheelsCountDownVC()],
        
        [CompactTimeVC(),
        CompactDateVC(),
        CompactDateTimeVC()],
        
        [InlineTimeVC(),
        InlineDateVC(),
        InlineDateTimeVC()]
    ]
    
    static let wheelsList = ["Time", "Date", "Date and Time", "Count Down Timer"]
    static let compactList = ["Time", "Date", "Date and Time"]
    static let inlineList = ["Time", "Date", "Date and Time"]
    
    let typeList = [wheelsList, compactList, inlineList]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
        configureTable()
    }
    
    func configureTable() {
        datePickerTable.dataSource = self
        datePickerTable.delegate = self
        datePickerTable.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        datePickerTable.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(datePickerTable)
        NSLayoutConstraint.activate([
            datePickerTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            datePickerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            datePickerTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePickerTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let file = fileNames[indexPath.section][indexPath.row]
        let vc = file
        navigationController?.pushViewController(vc, animated: true)

        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let cellTitle = typeList[indexPath.section][indexPath.row]
        content.text = cellTitle
        
        cell.contentConfiguration = content
        return cell
    }
    
    
}
