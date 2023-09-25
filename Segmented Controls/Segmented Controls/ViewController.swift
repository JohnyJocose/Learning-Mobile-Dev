//
//  ViewController.swift
//  Segmented Controls
//
//  Created by Johnathan Huijon on 8/18/23.
//

// Segmented controls are UI elements used for single-option selection, often in horizontal layouts. They're great for filtering, view mode toggling, and simple tabbed navigation.

import UIKit

class ViewController: UIViewController {

    // Syntax to create a segmented control
    let colorSegmented = UISegmentedControl(items: ["Cyan", "System Background"])

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .systemBackground
        buildSegmentedControl()
        configureSegmentedControl()
    }

    // Function to configure the segmented control
    func buildSegmentedControl() {
        // This will determine the selected index of the segmented control
        colorSegmented.selectedSegmentIndex = 1
        // This is how you add an action to the segmented control
        colorSegmented.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        colorSegmented.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            view.backgroundColor = .systemCyan
        case 1:
            view.backgroundColor = .systemBackground
        default:
            view.backgroundColor = .systemPink
        }
    }
    
    // Set up the segmented control
    func configureSegmentedControl() {
        view.addSubview(colorSegmented)
        
        NSLayoutConstraint.activate([
            colorSegmented.widthAnchor.constraint(equalToConstant: 300),
            colorSegmented.heightAnchor.constraint(equalToConstant: 50),
            colorSegmented.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorSegmented.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

