//
//  InlineDateTimeVC.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an in-depth exploration of Inline Date and Time Datepickers. The choice of using inline over compact or wheel is ideal when you want the date or time picker to be seamlessly displayed within the same view, offering an intuitive user experience. This approach proves particularly beneficial for iPad or larger screen layouts, where there's ample space to present the picker inline without consuming excessive screen real estate. Inline pickers offer a more integrated and efficient way for users to select dates and times, enhancing the overall usability of the app. For instance, in setting a future alarm, an inline date and time picker can be employed, providing users a convenient and integrated method to choose the desired date and time for their alarm.


class InlineDateTimeVC: UIViewController {

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
        // Setting the date picker's style to .inline for this particular instance.
        dateTimePicker.preferredDatePickerStyle = .inline
        // Setting the mode of this inline date picker to .dateAndTime. Note that for .inline style, all modes are available except for CountDown date pickers.
        dateTimePicker.datePickerMode = .dateAndTime
        // Depending on how you're using this date picker, like setting a future alarm, we need to set a minimum date. Keep in mind that the maximum date is also configurable based on your use case.
        dateTimePicker.minimumDate = .now
        
        
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
            // A minimum height of 400 points is recommended for the inline date picker to appear adequately. Larger heights typically look fine for the inline date picker.
            dateTimePicker.heightAnchor.constraint(equalToConstant: 400),
            dateTimePicker.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
    }
}
