//
//  ViewController.swift
//  UIProgressBar
//
//  Created by Johnathan Huijon on 8/27/23.
//

import UIKit

// This file demonstrates the usage and implementation of UIProgressBar, a UI element used to visually represent the progress of a task or process. UIProgressBar provides a way to indicate progress to the user, allowing for a better understanding of the task's completion status and giving feedback on the ongoing process.

class ViewController: UIViewController {

    let startProgressButton = UIButton()
    
    // Syntax to create a UIProgressView
    let progressBar = UIProgressView()
    
    // We're using a timer to mimic the duration of a loading bar.
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }

    func configureUI() {
        configureProgessBar()
        setUpProgressBar()
        configureButton()
        setUpButton()
        
    }
    
    // This function will start the progress bar.
    func startBar() {
        // I disable the button to prevent restarting the progress bar while it's ongoing.
        startProgressButton.isEnabled = false
        // Set the progress percentage back to 0 in case the button is pressed again.
        progressBar.progress = 0.0
        // Ensure that the progress bar is not hidden when the button is pressed again after it's completed.
        progressBar.isHidden = false
        // Start the timer, which repeats until the progress reaches 100%. Once this happens, stop the timer, hide the progress bar, and enable the button for pressing.
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { timer in
            self.progressBar.progress += 0.01
            if self.progressBar.progress >= 1.0 {
                self.stopTimer()
                self.progressBar.isHidden = true
                self.startProgressButton.isEnabled = true
            }
            
        })
    }
    
    // Function to stop the timer.
    func stopTimer() {
        timer.invalidate()
    }
    
    
    // Function called when the button is pressed to start the startBar() function.
    @objc func progressBarTimer() {
        startBar()
    }
    
    // Configure the button.
    func configureButton() {
        startProgressButton.configuration = .tinted()
        startProgressButton.configuration?.baseBackgroundColor = .systemGreen
        startProgressButton.configuration?.baseForegroundColor = .systemGreen
        startProgressButton.configuration?.buttonSize = .large
        startProgressButton.configuration?.cornerStyle = .medium
        startProgressButton.configuration?.title = "Start"
        startProgressButton.configuration?.titleAlignment = .center
        
        startProgressButton.addTarget(self, action: #selector(progressBarTimer), for: .touchUpInside)
        
        startProgressButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Place the button in the view.
    func setUpButton() {
        view.addSubview(startProgressButton)
        
        NSLayoutConstraint.activate([
            startProgressButton.widthAnchor.constraint(equalToConstant: 200),
            startProgressButton.heightAnchor.constraint(equalToConstant: 50),
            startProgressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startProgressButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    // Configure the progress bar.
    func configureProgessBar() {
        // You can set the starting position of the loading bar. Typically, starting at 0 makes sense when configuring it.
        progressBar.progress = 0.0
        // You can change the color of the progress bar.
        progressBar.progressTintColor = .systemRed
        // You can change the color of the non-progressed part of the progress bar as well.
        progressBar.trackTintColor = .darkGray
        progressBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Place the progress bar in the view.
    func setUpProgressBar() {
        view.addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            // The height of the progress bar is unchangeable, so you don't need to worry about setting it.
            progressBar.widthAnchor.constraint(equalToConstant: 300),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

