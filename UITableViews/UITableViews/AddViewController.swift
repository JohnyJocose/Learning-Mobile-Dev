//
//  AddViewController.swift
//  UITableViews
//
//  Created by Johnathan Huijon on 9/5/23.
//

import UIKit

class AddViewController: UIViewController {

    // Setting the delegate to the view controller is essential to access functions from that file within this context.
    weak var delegate: ViewController!
    
    let itemLabel = UILabel()
    let itemTextfield = UITextField()
    let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUI()
        
    }
    
    func configureUI() {
        configureTitle()
        configureTextfield()
        configureItemLabel()
        configureButton()
    }
    
    func setUI() {
        setViewBackground()
        setTextfield()
        setLabel()
        setButton()
        
    }
    
    func setButton() {
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 150),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.centerXAnchor.constraint(equalTo: itemTextfield.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -175)
        ])
    }
    
    func setLabel() {
        view.addSubview(itemLabel)
        NSLayoutConstraint.activate([
            itemLabel.leadingAnchor.constraint(equalTo: itemTextfield.leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: itemTextfield.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: itemTextfield.topAnchor, constant: -8)
        ])
    }
    
    func setTextfield() {
        view.addSubview(itemTextfield)
        NSLayoutConstraint.activate([
            itemTextfield.widthAnchor.constraint(equalToConstant: 250),
            itemTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemTextfield.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
    }
    
    func setViewBackground() {
        view.backgroundColor = .systemBackground
    }
    
    // This function is responsible for adding a new item to the list and invoking a function in the view controller file to update the table view accordingly.
    @objc func addButtonPressed() {
        // In this segment, we access the list array in the view controller, append a new item, and subsequently call the 'updateTableView' function to refresh the table view with the updated data.
        if let item = itemTextfield.text {
            delegate.groceryListArray.append(item)
            delegate.updateTableView()
            // To achieve the desired behavior of automatically navigating back to the previous screen upon adding an item, we utilize 'popViewController' to dismiss the current view controller.
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func configureButton() {
        var config = addButton.configuration
        config = .tinted()
        config?.baseBackgroundColor = .systemGreen
        config?.baseForegroundColor = .systemGreen
        config?.buttonSize = .medium
        config?.title = "Add New Item"
        addButton.configuration = config
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTextfield() {
        itemTextfield.placeholder = "New Item"
        itemTextfield.borderStyle = .roundedRect
        itemTextfield.backgroundColor = .tertiarySystemBackground
        
        itemTextfield.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureItemLabel() {
        itemLabel.text = "Enter New Grocery Item"
        itemLabel.textAlignment = .left
        itemLabel.numberOfLines = 1
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTitle() {
        navigationItem.title = "Add New Item"
    }

    // Called when the user clicks on the view outside of the UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}
