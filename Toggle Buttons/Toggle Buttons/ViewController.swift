//
//  ViewController.swift
//  Toggle Buttons
//
//  Created by Johnathan Huijon on 8/14/23.
//

//
// Description: This file presents an exploration of toggle buttons, a specialized implementation of UIButtons in Swift using Xcode. Toggle buttons function by alternating between two distinct configurations each time they are pressed. Upon activation, a toggle button carries out the designated UI action while transitioning between its two states. This functionality proves exceptionally valuable in scenarios such as sorting filters or indicating availability, where toggling between active and inactive states provides a streamlined way to control display and functionality.
//

import UIKit

class ViewController: UIViewController {
    

    let onLabel = UILabel()
    
    let themeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createToggleButton()
        configureLabel()
    }
    
    
    
    func createToggleButton() {

        // UIAction setup
        let themeToggleAction = UIAction(title: "") { _ in
            self.toggleLabel()
            
            
        }

        // The button
        themeButton.addAction(themeToggleAction, for: .touchUpInside)

        themeButton.changesSelectionAsPrimaryAction = true

        
        themeButton.configuration = .filled()
        
        themeButton.configuration?.baseBackgroundColor = .systemYellow
        themeButton.configuration?.baseForegroundColor = .white
        
        themeButton.configuration?.cornerStyle = .medium
        themeButton.configuration?.image = UIImage(systemName: "lightbulb.fill")
        
        
        // Initial state
        // This option is included if you prefer the pressed state to also be the selected state.
        themeButton.isSelected = showingHidden()
        
        
        themeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(themeButton)
        
        
        NSLayoutConstraint.activate([
            themeButton.widthAnchor.constraint(equalToConstant: 50),
            themeButton.heightAnchor.constraint(equalToConstant: 50),
            themeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeButton.topAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    func offButtonConfigurations() -> UIButton.Configuration{
        
        var config = themeButton.configuration
        config?.baseBackgroundColor = .black
        config?.baseForegroundColor = .gray
        return config!
    }
    
    func onButtonConfigurations() -> UIButton.Configuration{
        
        var config = themeButton.configuration
        config?.baseBackgroundColor = .systemYellow
        config?.baseForegroundColor = .white
        return config!
    }

    func toggleLabel() {
        if onLabel.isHidden == true {
            onLabel.isHidden = false
            themeButton.configuration = onButtonConfigurations()
        }
        else{
            onLabel.isHidden = true
            themeButton.configuration = offButtonConfigurations()
        }
    }
    
    func showingHidden() -> Bool {
        onLabel.isHidden = true
        if onLabel.isHidden {
            themeButton.configuration = offButtonConfigurations()
            return true
        }
        else{
            return false
        }
    }
    
    func configureLabel() {
        
        onLabel.text = "ON"
        onLabel.numberOfLines = 1
        onLabel.textColor = .systemYellow
        onLabel.font = .boldSystemFont(ofSize: 50)
        onLabel.textAlignment = .center
        onLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(onLabel)
        
        NSLayoutConstraint.activate([
            onLabel.widthAnchor.constraint(equalToConstant: 300),
            onLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onLabel.bottomAnchor.constraint(equalTo: themeButton.topAnchor, constant: -20)
        ])
        
        
    }
    
}

