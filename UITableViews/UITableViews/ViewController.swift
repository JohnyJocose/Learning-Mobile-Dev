//
//  ViewController.swift
//  UITableViews
//
//  Created by Johnathan Huijon on 9/2/23.
//

// This file encapsulates the logic and functionalities related to UITableViews in an iOS application. UITableViews are fundamental UI components that present data in a structured and organized manner, typically in a list or table format. This file contains implementations for handling data source and delegate methods, managing cell appearance and behavior, and facilitating user interaction within the table view.

// Additionally, this file delves into the topic of sending data between different files.

import UIKit

// In this section, we demonstrate the possibility of creating a custom class for the table view cell that can be registered with the table view. This custom cell class can include configuration elements such as labels and images to fit the table view cell. However, for this particular example, we won't be configuring these elements, but we're providing this information as a demonstration.
class GroceryTableCell: UITableViewCell {
    
}


class ViewController: UIViewController {
    
    
    // The following syntax demonstrates how to create a UITableView:
    let groceryListTable = UITableView()
    
    var groceryListArray = ["Bannana", "Watermelon", "Pineapple", "Grape", "Mayonaise", "Batteries", "Bread", "Ham", "Lettuce", "Toilet Paper"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    // This function is designed to reload the data within the UITableView. It's crucial for updating and reflecting any changes made to the data that should be visible on the TableView.
    func updateTableView() {
        groceryListTable.reloadData()
    }
    
    
    // UI Funcs
    func configureUI() {
        configureTable()
        setTable()
        setNavItems()
    }
    
    // In this example, there's a button located at the top right of the view controller. Tapping this button will navigate to a screen dedicated to adding data to the UITableView. A segue is set up to facilitate this navigation.
    @objc func segueToItemScreen() {
        let vc = AddViewController()
        // In this scenario, all functions created in this file are accessible for use in the next file. However, functions in the next file do not have direct access to and cannot affect functions in this file. To establish this connection and enable communication between the two files, a delegate is set in the next file to reference this view controller. Consequently, we set `vc.delegate = self` to establish this connection.
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // Configure a button on the right of the navigation bar that will trigger the segue to navigate to the 'ItemScreen'.
    func setNavItems() {
        
        navigationItem.title = "Grocery List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(segueToItemScreen))
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
    }
    
    
    // Here is the setup for configuring a UITableView.
    func configureTable() {
        // We need to register a cell for the UITableView. In this case, we registered a custom cell we created earlier. If you want to register a default UITableViewCell, use UITableViewCell.self.
        groceryListTable.register(GroceryTableCell.self, forCellReuseIdentifier: "cell")
        // It's important to set the delegate and datasource of the UITableView to 'self'. This allows access to the necessary functions for setting up and managing the table view.
        groceryListTable.delegate = self
        groceryListTable.dataSource = self
        
        groceryListTable.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // Set up the UITableView in the view and apply appropriate constraints. Usually, you'd configure it to occupy the entire page. However, for alternative layouts like a side menu, it may only occupy a fraction of the screen, such as one-third.
    func setTable() {
        view.addSubview(groceryListTable)
        
        NSLayoutConstraint.activate([
            groceryListTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            groceryListTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groceryListTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            groceryListTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // These functionalities are accessible exclusively through a UITableView's delegate and dataSource.
    
    // In the context of a UITableView, "rows" refer to individual elements within a table cell, while "sections" pertain to the grouping or organization of these table cells. The function being referred to here is one that determines the number of rows in a specific section of the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groceryListArray.count
    }
    
    // This function determines the actions to be taken when reaching a specific cell row in the table view. It's the ideal place to set up various aspects of the cell, such as its content (e.g., text). If you've created a custom table view cell class, you can encapsulate the cell setup logic within a function within that class. In this case, since we're not using a custom cell class, we directly set up the cell's content, like its text, in this function.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        
        // This section demonstrates how to set up the text content of the cell. Note that you can also set up other aspects like images, but we're focusing on text configuration for this example.
        var content = cell.defaultContentConfiguration()
        content.text = groceryListArray[row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    // This function is triggered when a row is selected. Usually, when something is selected, we'd want to deselect that row to remove the highlighting effect. In this particular example, we want it to perform a segue to navigate to the next screen, which will display the item's location in the grocery store.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = SecondViewController()
        // With the creation of the second view controller, we now have access to the functions and variables defined in that file. This access allows us to send data, such as the item's name, to the next screen for further processing or display.
        vc.groceryItem = groceryListArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // The functions presented here facilitate the swipe-to-delete functionality within a UITableView. When a user swipes a cell to the left, an option to delete the corresponding item appears. While there are other editing styles available, this example specifically focuses on the delete functionality.
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // When deleting an item from the UITableView, it's crucial to also remove the item from the data source (where the table's data is sourced). If this step is omitted, the item may reappear if the cell is reloaded or the table view is refreshed.
        if editingStyle == .delete {
            tableView.beginUpdates()
            groceryListArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
    
}

