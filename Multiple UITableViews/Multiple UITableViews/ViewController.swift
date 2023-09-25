//
//  ViewController.swift
//  Multiple UITableViews
//
//  Created by Johnathan Huijon on 9/9/23.
//

import UIKit

// This file demonstrates how to manage and display multiple UITableViews within a single view controller. It showcases the organization and handling of distinct UITableViews, each serving a specific purpose or displaying unique sets of data. The implementation involves setting up and managing different UITableView instances, assigning appropriate delegates and data sources, handling interactions, and ensuring a seamless user experience while navigating and interacting with each table view.

// Additionally, many of the principles demonstrated in this file can be repeated and adapted for UICollectionViews, allowing for similar organization and management of multiple UICollectionViews within a single view controller.


class ViewController: UIViewController {

    // Create your table views; in this example, I'm using a base table view and one that is .insetGrouped styled
    var table1 = UITableView()
    var table2 = UITableView(frame: .zero, style: .insetGrouped)
    
    // Info that will be in table2; table1 will just have numbers for its index path in rows
    var table2SelctionTitles = ["Animal", "Plants", "Elements", "Planets"]
    var titlesInfoArray = [["Penguins", "Polar Bears", "Seals"], ["Oak Tree", "Blue Bonnet", "Cherry Blossoms"], ["Hydrogen", "Oxygen", "Carbon", "Iron", "Uranium"], ["Earth", "Jupiter", "Mars", "Pluto", "Venus", "Saturn"]]
    
    
    var label1 = UILabel()
    var label2 = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpUI()
    }
    

    func setUpUI() {
        setUpTable1()
        setUpTable2()
        setUpLabel1()
        setUpLabel2()
    }
    
    func setUpLabel2() {
        view.addSubview(label2)
        
        NSLayoutConstraint.activate([
            label2.centerYAnchor.constraint(equalTo: table2.centerYAnchor),
            label2.topAnchor.constraint(equalTo: table1.bottomAnchor),
            label2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: table2.trailingAnchor)
        ])
    }
    
    func setUpLabel1() {
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label1.centerYAnchor.constraint(equalTo: table1.centerYAnchor),
            label1.leadingAnchor.constraint(equalTo: table1.trailingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label1.bottomAnchor.constraint(equalTo: table2.topAnchor)
        ])
        
    }
    
    // Only thing you have to make sure about when setting up your table views is that your table views don't overlap, unless that's your intention. In which case, proceed as needed. However, unless you employ some isHidden mechanics for like a side menu, you can experience conflicts between the two table views.
    func setUpTable1() {
        view.addSubview(table1)
        
        NSLayoutConstraint.activate([
            table1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table1.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            table1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30)
        ])
    }
    
    func setUpTable2() {
        view.addSubview(table2)
        
        NSLayoutConstraint.activate([
            table2.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            table2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table2.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30)
            

        ])
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureTable1()
        configureTable2()
        configureLabel1()
        configureLabel2()
    }
    
    func configureLabel2() {
        label2.text = " Table 2\n--->"
        label2.font = .boldSystemFont(ofSize: 40)
        label2.textAlignment = .center
        label2.numberOfLines = 0
        label2.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureLabel1() {
        label1.text = "Table 1 \n<---"
        label1.font = .boldSystemFont(ofSize: 40)
        label1.textAlignment = .center
        label1.numberOfLines = 0
        label1.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Everything you do to configure a UITableView is exactly the same; if you need to go more in-depth into how this works, please go to the UITableView project in this directory to learn about it.
    func configureTable1() {
        table1.delegate = self
        table1.dataSource = self
        table1.register(UITableViewCell.self, forCellReuseIdentifier: "table1Cell")
        
        table1.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTable2() {
        table2.delegate = self
        table2.dataSource = self
        table2.register(UITableViewCell.self, forCellReuseIdentifier: "table2Cell")
        
        
        table2.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Here's where we delve into how to ensure each UITableView functions correctly when utilizing the UITableViewDelegate and UITableViewDataSource functions. You can use switches or if/else cases to determine the type of UITableView being operated on within the functions.
    // Once the type of UITableView is determined, you proceed to write code tailored for that specific table view as if it were intended for that particular scenario. In the other cases or within the if/else blocks, you write code for the next respective table view.
    // If you need to learn how switches or if/else statements work, please visit the respective projects in the repository here.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
        case table2:
            return table2SelctionTitles[section]
        default:
            return nil
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableView {
        case table1:
            return 1
        case table2:
            return table2SelctionTitles.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case table1:
            return 10
        case table2:
            return titlesInfoArray[section].count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case table1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "table1Cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = String(indexPath.row + 1)
            cell.contentConfiguration = content
            cell.accessoryType = .disclosureIndicator
            return cell
            
        case table2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "table2Cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = titlesInfoArray[indexPath.section][indexPath.row]
            cell.contentConfiguration = content
            cell.accessoryType = .detailButton
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
}

