//
//  WheelsCountDownVC.swift
//  UIDatePickers
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file provides an in-depth exploration of a Wheel Countdown Timer, exclusively accessible with the .wheel style. The wheel countdown timer is ideal for timer scenarios, allowing users to set precise durations seamlessly. It offers an intuitive user experience, making it easy for users to adjust the timer according to their needs. The .wheel style is particularly suitable for providing a visual representation of the countdown, enhancing the app's usability and efficiency, especially in scenarios like setting a timer.


class WheelsCountDownVC: UIViewController {

    // Variables related to the date picker.
    let questionLabel = UILabel()
    let countdownPicker = UIDatePicker()
    
    let countdownTimer = UILabel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureQuestionLabel()
        configurePicker()
        configureAlarmLabel()
        setCountDown()
    }
    
    func configureAlarmLabel() {
        countdownTimer.font = .boldSystemFont(ofSize: 30)
        countdownTimer.text = "Countdown set for: \n"
        countdownTimer.numberOfLines = 2
        countdownTimer.textAlignment = .center
        countdownTimer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countdownTimer)
        NSLayoutConstraint.activate([
            countdownTimer.topAnchor.constraint(equalTo: countdownPicker.bottomAnchor, constant: 20),
            countdownTimer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countdownTimer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countdownTimer.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureQuestionLabel() {
        questionLabel.textAlignment = .center
        questionLabel.text = "Set Countdown"
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
    
    func setCountDown() {
        // Creating a variable to store the selected time from the date picker.
        let time = countdownPicker.date
        // Create Date Formatter
        // There are many ways to format a date's time; this is just one of the approaches. Other files go over various types of date and time formatting.
        let formatter3 = DateFormatter()
        // For guidance on the symbols to use for date formatting, please refer to the "dateFormatPic" file in this repository.
        formatter3.dateFormat = "HH:mm"
        
        countdownTimer.text = "Countdown set for: \n\(formatter3.string(from: time))"
        
    }
    
    func configurePicker() {
        // Setting the date picker's style to .wheels for this particular instance.
        countdownPicker.preferredDatePickerStyle = .wheels
        // Setting preferredDatePickerStyle to .wheels is essential, as it's the only style compatible with a countdown timer. It allows the timer to go up to 23:59
        countdownPicker.datePickerMode = .countDownTimer
        
        
        let alarmLabelAction = UIAction(title: "") { _ in
            self.setCountDown()
        }
        // To add an action to the date picker when a value is changed, you can achieve it like this.
        countdownPicker.addAction(alarmLabelAction, for: .valueChanged)
        
        // Adding the date picker to the view and setting appropriate constraints.
        countdownPicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countdownPicker)
        NSLayoutConstraint.activate([
            countdownPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countdownPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countdownPicker.heightAnchor.constraint(equalToConstant: 200),
            countdownPicker.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
    }
}
