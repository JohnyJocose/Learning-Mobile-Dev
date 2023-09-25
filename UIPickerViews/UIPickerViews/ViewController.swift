//
//  ViewController.swift
//  UIPickerViews
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file is dedicated to the UIPickerView, an essential component that allows users to choose from a list of options presented in a scrollable and selectable interface. UIPickerView is widely used for various selection scenarios, such as choosing a date, time, or any custom options. This file covers the setup, customization, and interaction with UIPickerView to provide an efficient and intuitive user experience. Implementing UIPickerView provides a structured and user-friendly way to handle selections within an application, making it a fundamental element in creating polished and functional iOS interfaces.


class ViewController: UIViewController {
    
    
    // Create a UIPickerView variable using this syntax.
    let statePicker = UIPickerView()
    // This UIPickerView will be used to represent different states.
    let states = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        configurePicker()
    }
    
    func configurePicker() {
        // You need to set UIPickerView's delegate and datasource in order to handle titles, selections, and related functionalities.
        statePicker.delegate = self
        statePicker.dataSource = self
        
        statePicker.translatesAutoresizingMaskIntoConstraints = false
        
        // You can programmatically set the selected row for each component within the UIPickerView.
        // The default starting position is the first row for each component, keeping in mind that it's not selected until the user interacts with the picker wheel.
        statePicker.selectRow(0, inComponent: 0, animated: true)
        statePicker.selectRow(states.count-1, inComponent: 1, animated: true)
        
        
        view.addSubview(statePicker)
        
        NSLayoutConstraint.activate([
            statePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            statePicker.heightAnchor.constraint(equalToConstant: 250)
        ])
        
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // The number of picker wheels in a UIPickerView can vary based on the specific use case. For instance, when setting an alarm, you might typically use two components: one for the hour and another for the minute.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // This piece of code informs the UIPickerView about the number of rows in a particular component.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    // This code sets the title for each row within a component in the UIPickerView.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    // This code performs an action based on the selected row within a component.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(states[row])
    }
    
    
    
}

