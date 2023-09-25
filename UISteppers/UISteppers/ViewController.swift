//
//  ViewController.swift
//  UISteppers
//
//  Created by Johnathan Huijon on 8/30/23.
//

import UIKit

// This file demonstrates the usage and implementation of UIStepper, a UI element used to increment or decrement a value by a predefined step. UIStepper is typically used to provide a simple way for users to adjust numerical values in an application, such as adjusting quantity or setting values within a specific range.


class ViewController: UIViewController {

    // Syntax to create a UIStepper
    let counter = UIStepper()
    
    // Label that will display a number, which increases or decreases based on the UIStepper interactions.
    let counterLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }


    func configureUI() {
        configureStepper()
        placeStepper()
        configureLabel()
        placeLabel()
    }
    
    // Configure the label.
    func configureLabel() {
        counterLabel.text = String(Int(counter.value))
        counterLabel.font = .boldSystemFont(ofSize: 35)
        counterLabel.textAlignment = .center
        counterLabel.numberOfLines = 0
        
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Place the label in the view.
    func placeLabel() {
        view.addSubview(counterLabel)
        
        NSLayoutConstraint.activate([
            counterLabel.widthAnchor.constraint(equalToConstant: 300),
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: counter.topAnchor, constant: -30)
        ])
    }
    
    // Function called each time the stepper is pressed, incrementing or decrementing the label by 5s (something we set when configuring the stepper).
    @objc func adjustLabelNum(_ sender: UIStepper) {
        counterLabel.text = String(Int(counter.value))
    }
    
    // Configure the UIStepper.
    func configureStepper() {
        // Set the minimum and maximum values for the stepper.
        counter.maximumValue = 100
        counter.minimumValue = 0
        // Set a starting value for the stepper.
        counter.value = 0
        // Set the increment value for the stepper.
        counter.stepValue = 5
        // If the user holds down the minus or plus button, the stepper will continue subtracting or adding.
        counter.autorepeat = true
        // If isContinuous is true, the stepper sends value change events immediately as the value changes during user interaction. If false, the stepper sends a value change event after user interaction ends.
        counter.isContinuous = true
        // If wrapping is enabled, when the user reaches the maximum or minimum value, the stepper will wrap around to the opposite end.
        counter.wraps = true
        
        // Define an action to be executed when the button is pressed.
        counter.addTarget(self, action: #selector(adjustLabelNum(_:)), for: .touchUpInside)
        
        counter.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Place the stepper in the view.
    func placeStepper() {
        view.addSubview(counter)
        
        NSLayoutConstraint.activate([
            // Steppers have a set height and width, so you don't need to set those explicitly.
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counter.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

