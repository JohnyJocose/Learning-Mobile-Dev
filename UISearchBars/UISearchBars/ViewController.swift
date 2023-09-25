//
//  ViewController.swift
//  UISearchBars
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file is dedicated to the UISearchBar, an essential component that allows users to search within the app. It provides a quick and efficient way to search through content or data. The UISearchBar can be integrated into the navigation bar's title view, providing a seamless and intuitive search experience. This file covers the setup, customization, and integration of UISearchBar, demonstrating how to place it within the navigation bar's title view. Implementing UISearchBar enhances user interaction, making searching for specific content within the app both convenient and effective.


class ViewController: UIViewController {
    
    // Variables needed for UISearchBar. Note that the associated view can be either a table view or a collection view.
    let grocerySearchBar = UISearchBar()
    let groceryTable = UITableView()
    
    let groceryList = ["Apple", "Banana", "Pear", "Watermelon", "Pineapple", "Peach"]
    var searchedList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        searchedList = groceryList
        view.backgroundColor = .systemBackground
        configureSearchBar()
        configureTable()
    }
    
    func configureTable() {
        groceryTable.dataSource = self
        groceryTable.delegate = self
        groceryTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        groceryTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groceryTable)
        NSLayoutConstraint.activate([
            groceryTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            groceryTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groceryTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            groceryTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // Searchbar Code
    func configureSearchBar() {
        // Setting the delegate allows us to access functions used by the UISearchBar, such as handling edits and search button presses.
        grocerySearchBar.delegate = self
        // Enabling this functionality will display a cancel button on the right side of the search bar, allowing users to cancel the search.
        grocerySearchBar.showsCancelButton = true
        // This is how we integrate the UISearchBar into the navigation item's title view.
        navigationItem.titleView = grocerySearchBar
        // In this specific case, the UISearchBar is pre-activated upon initial screen presentation, as it aligns with the desired functionality for this particular use case.
        grocerySearchBar.becomeFirstResponder()
        // Enabling this functionality ensures that the return key is available even if nothing has been typed into the UISearchBar.
        grocerySearchBar.enablesReturnKeyAutomatically = false
        
    }
    
    


}

extension ViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    // Search bar code
    
    // If the cancel button is clicked, we ensure that the UISearchBar is no longer activated.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // This function is called whenever there's a change in the search bar, allowing us to filter and update the table accordingly. It's typically beneficial when the list isn't extensive.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Setting the search bar text to lowercase enables us to perform case-insensitive matching with the text in the item list, which is also lowercased.
        let searchText = searchBar.text?.lowercased()
        // If the search bar is empty, we ensure that everything is displayed. It's essential to reload the table's data to refresh its content accordingly.
        if searchText == "" || searchText == nil {
            searchedList = groceryList
            groceryTable.reloadData()
        }
        else {
            // If the search bar is not empty, we iterate through each word in the list to determine if the search text is contained within any of them.
            searchedList = []
            // It's important to reload the list both before and after the search operation. Reloading before ensures that if the search text isn't in the list, it won't update and will retain the previous search. Reloading after is necessary to update the list with the search results.
            groceryTable.reloadData()
            for word in groceryList {
                if word.lowercased().contains(searchText!) {
                    searchedList.append(word)
                    groceryTable.reloadData()
                }
            }
        }
    }
    
    
    // This function updates the table only when the user hits the search button. It's commented out because the previous function is more aligned with our requirements. It's provided here as an example, and you can uncomment and comment out the appropriate function to test.

//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let searchText = searchBar.text
//        if searchText == "" || searchText == nil {
//            searchedList = groceryList
//            groceryTable.reloadData()
//        }
//        else {
//            searchedList = []
//            groceryTable.reloadData()
//            for word in groceryList {
//                if word.contains(searchText!) {
//                    searchedList.append(word)
//                    groceryTable.reloadData()
//                }
//            }
//        }
//    }
    
    
    // Table code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = searchedList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
