//
//  CompactDateTimeVC.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an in-depth exploration of a Compact Date and Time Picker ideal for setting future alarms in this files case. Opting for the compact style is a great choice when you want a more space-efficient representation of the date and time picker, providing an intuitive user experience. This approach is particularly beneficial for various device layouts, especially where space is limited. The compact date and time picker offer an efficient and straightforward way for users to select their desired date and time for setting a future alarm.


class CompactDateTimeVC: UIViewController {

    // Variables related to the date picker.
    let questionLabel = UILabel()
    let dateTimePicker = UIDatePicker()
    
    let futureAlarm = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureQuestionLabel()
        configurePicker()
        configureAlarmLabel()
        setFutureAlarm()
    }
    
    func configureAlarmLabel() {
        futureAlarm.font = .boldSystemFont(ofSize: 25)
        futureAlarm.text = "Future alarm set for: \n"
        futureAlarm.numberOfLines = 2
        futureAlarm.textAlignment = .center
        futureAlarm.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(futureAlarm)
        NSLayoutConstraint.activate([
            futureAlarm.topAnchor.constraint(equalTo: dateTimePicker.bottomAnchor, constant: 20),
            futureAlarm.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            futureAlarm.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            futureAlarm.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureQuestionLabel() {
        questionLabel.textAlignment = .center
        questionLabel.text = "Set Future Alarm"
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
    
    func setFutureAlarm() {
        // Creating a variable to store the selected time from the date picker.
        let time = dateTimePicker.date
        
        // Create Date Formatter
        // There are many ways to format a date's time; this is just one of the approaches. Other files go over various types of date and time formatting.
        let dateFormatter = DateFormatter()

        // Set Date/Time Style
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        
        futureAlarm.text = "Future alarm set for: \n\(dateFormatter.string(from: time))"
        
    }
    
    func configurePicker() {
        // Setting the date picker's style to .compact for this particular instance.
        dateTimePicker.preferredDatePickerStyle = .compact
        // Setting the mode of this compact date picker to .dateAndTime. Note that for .compact style, all modes are available except for CountDown date pickers.
        dateTimePicker.datePickerMode = .dateAndTime
        // Depending on how you're using this date picker, like setting a future alarm, we need to set a minimum date. Keep in mind that the maximum date is also configurable based on your use case.
        dateTimePicker.minimumDate = .now
        // Setting the contentHorizontalAlignment to center to ensure the inline date picker appears at the center. Without this adjustment, it might display on the right, which is likely not the intended behavior.
        dateTimePicker.contentHorizontalAlignment = .center
        
        
        let alarmLabelAction = UIAction(title: "") { _ in
            self.setFutureAlarm()
            
            
        }
        // To add an action to the date picker when a value is changed, you can achieve it like this.
        dateTimePicker.addAction(alarmLabelAction, for: .valueChanged)
        
        // Adding the date picker to the view and setting appropriate constraints.
        dateTimePicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dateTimePicker)
        NSLayoutConstraint.activate([
            dateTimePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateTimePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateTimePicker.heightAnchor.constraint(equalToConstant: 200),
            dateTimePicker.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
    }

}
