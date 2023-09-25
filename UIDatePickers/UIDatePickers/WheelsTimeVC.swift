//
//  WheelsTimeVC.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an in-depth exploration of a Wheel Time Picker, ideal for setting an alarm. The wheel time picker allows users to seamlessly select the desired alarm time, offering an intuitive user experience. It makes it easy for users to precisely set the alarm time according to their preferences, enhancing the overall usability and efficiency of the app, especially in scenarios like setting an alarm. The .wheel style provides a visual representation of the time, making the selection process straightforward and efficient.

class WheelsTimeVC: UIViewController {

    // Variables related to the date picker.
    let questionLabel = UILabel()
    let timePicker = UIDatePicker()
    
    let alarmTime = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureQuestionLabel()
        configurePicker()
        configureAlarmLabel()
        setAlarmTime()
    }
    
    func configureAlarmLabel() {
        alarmTime.font = .boldSystemFont(ofSize: 30)
        alarmTime.text = "Alarm set for: \n"
        alarmTime.numberOfLines = 2
        alarmTime.textAlignment = .center
        alarmTime.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(alarmTime)
        NSLayoutConstraint.activate([
            alarmTime.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            alarmTime.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alarmTime.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            alarmTime.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureQuestionLabel() {
        questionLabel.textAlignment = .center
        questionLabel.text = "Set Alarm Time"
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
    
    func setAlarmTime() {
        // Creating a variable to store the selected time from the date picker.
        let time = timePicker.date
        // Create Date Formatter
        // There are many ways to format a date's time; this is just one of the approaches. Other files go over various types of date and time formatting.
        let formatter3 = DateFormatter()
        // For guidance on the symbols to use for date formatting, please refer to the "dateFormatPic" file in this repository.
        formatter3.dateFormat = "hh:mm a"
        
        alarmTime.text = "Alarm set for: \n\(formatter3.string(from: time))"
        
    }
    
    func configurePicker() {
        // Setting the date picker's style to .wheels for this particular instance.
        timePicker.preferredDatePickerStyle = .wheels
        // Setting the mode of this wheels date picker to .time. Note that for .wheels style, all modes are available except for CountDown date pickers.
        timePicker.datePickerMode = .time
        let alarmLabelAction = UIAction(title: "") { _ in
            self.setAlarmTime()
        }
        // To add an action to the date picker when a value is changed, you can achieve it like this.
        timePicker.addAction(alarmLabelAction, for: .valueChanged)
        
        // Adding the date picker to the view and setting appropriate constraints.
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(timePicker)
        NSLayoutConstraint.activate([
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timePicker.heightAnchor.constraint(equalToConstant: 200),
            timePicker.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
    }
    

}
