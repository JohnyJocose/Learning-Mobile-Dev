//
//  WheelsDateVC.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an in-depth exploration of a Wheel Date Picker, which is ideal for selecting a birthdate. The wheel date picker allows users to seamlessly choose their birthdate, offering an intuitive user experience. It makes it easy for users to precisely select the desired date, enhancing the overall usability and efficiency of the app, especially in scenarios like choosing one's birthdate. The .wheel style provides a visual representation of the date, making the selection process straightforward and efficient.


class WheelsDateVC: UIViewController {
    
    // Variables related to the date picker.
    let questionLabel = UILabel()
    let datePicker = UIDatePicker()
    
    let bornDay = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureQuestionLabel()
        configurePicker()
        configureAlarmLabel()
        setBirthDate()
    }
    
    func configureAlarmLabel() {
        bornDay.font = .boldSystemFont(ofSize: 30)
        bornDay.text = "You were born on: \n"
        bornDay.numberOfLines = 2
        bornDay.textAlignment = .center
        bornDay.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bornDay)
        NSLayoutConstraint.activate([
            bornDay.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            bornDay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bornDay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bornDay.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureQuestionLabel() {
        questionLabel.textAlignment = .center
        questionLabel.text = "Set Birth Date"
        questionLabel.font = .boldSystemFont(ofSize: 40)
        questionLabel.numberOfLines = 0
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    func setBirthDate() {
        // Variables related to the date picker.
        let time = datePicker.date
        
        // Create Date Formatter
        // There are many ways to format a date's time; this is just one of the approaches. Other files go over various types of date and time formatting.
        let formatter3 = DateFormatter()
        // For guidance on the symbols to use for date formatting, please refer to the "dateFormatPic" file in this repository.
        formatter3.dateFormat = "MMMM d, YYYY"
        
        bornDay.text = "You were born on: \n\(formatter3.string(from: time))"
        
    }
    
    func configurePicker() {
        // Setting the date picker's style to .wheels for this particular instance.
        datePicker.preferredDatePickerStyle = .wheels
        // Setting the mode of this wheels date picker to .date. Note that for .wheels style, all modes are available.
        datePicker.datePickerMode = .date
        // Depending on how you're using this date picker, like choosing your birthdate, we need to set a maximum date. Keep in mind that the minimum date is also configurable based on your use case.
        datePicker.maximumDate = .now
        
        let alarmLabelAction = UIAction(title: "") { _ in
            self.setBirthDate()
        }
        // To add an action to the date picker when a value is changed, you can achieve it like this.
        datePicker.addAction(alarmLabelAction, for: .valueChanged)
        
        // Adding the date picker to the view and setting appropriate constraints.
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: 200),
            datePicker.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
    }
    
}
