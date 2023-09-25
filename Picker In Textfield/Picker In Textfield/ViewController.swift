//
//  ViewController.swift
//  Picker In Textfield
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file is a concise extension on picker views integrated with text fields. It offers a quick overview of incorporating views into text fields. Typically, we associate keyboards with typing, but at times, having additional information or options within the keyboard area can be useful, especially when it doesn't require a lot of space in the app. This approach proves to be easy and convenient for users.

class ViewController: UIViewController {

    // In this section, we're creating variables related to the picker view. For a more in-depth explanation, please refer to the "UIPickerViews" file in the repository.
    let textfield = UITextField()
    let statePicker = UIPickerView()
    let states = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        configureTextfield()
        configurePicker()
    }
    
    @objc func doneButtonPressed(_ sender:UIButton) {
        // In case the "Done" button is pressed and the picker view hasn't been scrolled (thus not automatically selecting any value), we handle this edge case by programmatically selecting the first value in the picker view. This ensures that even if the user hasn't interacted with the picker, the initial value is considered as selected.
        if textfield.text == ""{
            textfield.text = states[0]
        }
        // If the "Done" button is pressed, we make the text field disappear using this code snippet.
        textfield.resignFirstResponder()
    }
    
    func configureTextfield() {
        // configure the textfield
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .tertiarySystemBackground
        // To enhance user experience, we add a toolbar at the top, providing access to a "Done" button. This ensures users can easily indicate they're done with their selection from the picker.
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed(_:)))
        toolBar.setItems([spaceButton, doneButton], animated: true)
        textfield.inputAccessoryView = toolBar
        
        // In this example, we set the text indicator icon to clear. This choice is deliberate as we don't want it to be visible since the keyboard isn't accessible, being taken up by the picker view.
        textfield.tintColor = .clear
        textfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textfield)
        NSLayoutConstraint.activate([
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textfield.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configurePicker() {
        statePicker.delegate = self
        statePicker.dataSource = self
        
        // This is a crucial part of this file: ensuring the picker is set as the input view for the text field using this code snippet.
        // This means when the user taps this text field, where they would typically expect the keyboard to appear, the picker becomes visible instead.
        textfield.inputView = statePicker
        
        statePicker.translatesAutoresizingMaskIntoConstraints = false
        
        statePicker.selectRow(0, inComponent: 0, animated: true)
    }

}

// Code related to the picker. For any questions, please refer to the "UIPickerViews" file in the repository.
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textfield.text = states[row]
    }
    
}
