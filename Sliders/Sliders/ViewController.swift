//
//  ViewController.swift
//  Sliders
//
//  Created by Johnathan Huijon on 8/25/23.
//

import UIKit

// This file serves as a comprehensive guide to working with UI sliders in iOS development. UI sliders are essential UIKit components that allow users to select a value from a specified range. The file covers fundamental concepts such as creating sliders, setting up their appearance, customizing their appearance and behavior, and implementing actions in response to value changes. Developers can refer to this file to gain a thorough understanding of effectively implementing and utilizing UI sliders to enhance user interaction and experience.

class ViewController: UIViewController {
    
    // Syntax to create a slider
    var slider = UISlider()
    let volumeBalanceLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }

    func configureUI() {
        configureSlider()
        setSlider()
        configureLabel()
    }
    
    // This is a function that will change the label to match the output determined by what position the slider is in. Sliders work with floats, which is why we have a float as one of its parameters.
    func createOutputString(sliderValue: Float) -> String {
        var output = ""
        var leftOutput: Float = 100.00
        var rightOutput: Float = 100.00
        if sliderValue < Float(0) {
            leftOutput += abs(sliderValue)
            rightOutput -= abs(sliderValue)
        }
        else if sliderValue > Float(0) {
            leftOutput -= abs(sliderValue)
            rightOutput += abs(sliderValue)
        }
        else {
            leftOutput = 100.00
            rightOutput = 100.00
        }
        let leftString = String(format: "%.2f", leftOutput)
        let rightString = String(format: "%.2f", rightOutput)
        output = "Left Airpod Output: \(leftString)% : Right Airpod Output: \(rightString)%"
        return output
    }
    
    // Function to set the label's text
    func setLabelText() {
        volumeBalanceLabel.text = createOutputString(sliderValue: slider.value)
    }
    
    func configureLabel() {
        setLabelText()
        volumeBalanceLabel.numberOfLines = 0
        volumeBalanceLabel.font = .boldSystemFont(ofSize: 13)
        volumeBalanceLabel.textAlignment = .center
        volumeBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(volumeBalanceLabel)
        NSLayoutConstraint.activate([
            volumeBalanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            volumeBalanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            volumeBalanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            volumeBalanceLabel.bottomAnchor . constraint(equalTo: slider.topAnchor, constant: -30)
        ])
    }
    

    @objc func printValue(_ sender: UISlider) {
        setLabelText()
    }
    
    // This is the code needed to configure a slider
    func configureSlider() {
        // A slider has to have a minimum and maximum value in order to function; it can go into the negatives
        slider.maximumValue = 100
        slider.minimumValue = -100
        // You set its value as well
        slider.value = 0
        // You can also put images on the edges
        slider.minimumValueImage = UIImage(systemName: "airpodpro.left")
        slider.maximumValueImage = UIImage(systemName: "airpodpro.right")
        // And change their tints
        slider.maximumTrackTintColor = .systemRed
        slider.minimumTrackTintColor = .systemCyan
        // You can also change the thumb's tint
        slider.thumbTintColor = .green
        // You can also change the color of the images on the side
        slider.tintColor = .gray
        // If we are not needing the data while it's sliding and just the last value, then we set this to false
        slider.isContinuous = true
        // Add an action to the slider
        slider.addTarget(self, action: #selector(printValue(_:)), for: .valueChanged)
        
        
        slider.translatesAutoresizingMaskIntoConstraints = false
    }

    func setSlider() {
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([
            // Height anchor does not need to be set since it's always the same size
            slider.widthAnchor.constraint(equalToConstant: 300),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}

