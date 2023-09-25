//
//  InlineDateVC.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an in-depth exploration of an Inline Date Picker specifically tailored for selecting birth dates in this example. Choosing the inline style over compact or wheel is perfect for seamlessly presenting the date picker within the same view, delivering an intuitive user experience. This approach is especially valuable for iPad or larger screen layouts, utilizing the ample space available to showcase the picker inline without occupying excessive screen real estate.


class InlineDateVC: UIViewController {

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
        // Setting the date picker's style to .inline for this particular instance.
        datePicker.preferredDatePickerStyle = .inline
        // Setting the mode of this inline date picker to .date. Note that for .inline style, all modes are available except for CountDown date pickers.
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
            // A minimum height of 350 points is recommended for the inline date picker to appear adequately. Larger heights typically look fine and provide a visually pleasing display for the inline date picker.
            datePicker.heightAnchor.constraint(equalToConstant: 350),
            datePicker.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
    }
}
