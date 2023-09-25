//
//  ViewController.swift
//  UiSwitches
//
//  Created by Johnathan Huijon on 8/25/23.
//

import UIKit

// This file demonstrates the usage and implementation of UISwitch, a UI element used to toggle between two states: on and off. UISwitch provides a simple and intuitive way for users to control settings or enable/disable features within an application. This file showcases various functionalities and configurations related to UISwitch.
 
class ViewController: UIViewController {

    // Syntax to create a UISwitch
    let mySwitch = UISwitch()
    var switchButton = UISwitch()
    var OnOffLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }


    func configureUI() {
        configureSwitch()
        setUpSwitch()
        configureOnOffLabel()
    }
    
    // Function that changes the label's text and color to "On" and match the color of the switch when the switch is on, and to "Off" and a different color when the switch is off.
    func labelPowerState() {
        if switchButton.isOn {
            OnOffLabel.text = "ON"
            OnOffLabel.textColor = .systemGreen
        }
        else {
            OnOffLabel.text = "OFF"
            OnOffLabel.textColor = .gray
        }
    }
    
    // Configure the label.
    func configureOnOffLabel() {
        labelPowerState()
        OnOffLabel.font = .boldSystemFont(ofSize: 40)
        OnOffLabel.textAlignment = .center
        OnOffLabel.numberOfLines = 0
        OnOffLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(OnOffLabel)
        NSLayoutConstraint.activate([
            OnOffLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            OnOffLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            OnOffLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            OnOffLabel.bottomAnchor.constraint(equalTo: switchButton.topAnchor, constant: -30)
        ])
    }
    
    // This will be called when the switch is pressed, triggering the labelPowerState function.
    @objc func turnOnPower(_ sender: UISwitch) {
        labelPowerState()
    }
    
    // Configure the UISwitch.
    func configureSwitch() {
        // You can set the style of the UISwitch.
        switchButton.preferredStyle = .automatic
        // You can set the state of the UISwitch.
        switchButton.isOn = true
        // Define an action for the switch; here, it's set to trigger the turnOnPower function when the switch is pressed.
        switchButton.addTarget(self, action: #selector(turnOnPower(_:)), for: .touchUpInside)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // Place the UISwitch in the view.
    func setUpSwitch() {
        view.addSubview(switchButton)
        
        NSLayoutConstraint.activate([
            
            switchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

