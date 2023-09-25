//
//  ViewController.swift
//  UIActivityIndicators
//
//  Created by Johnathan Huijon on 8/25/23.
//

// This file provides a comprehensive guide to using UIActivityIndicatorView in iOS development. UIActivityIndicatorView is a crucial component for indicating ongoing tasks to users. The file covers essential concepts such as creating, configuring, and customizing activity indicators,and managing their appearance and behavior. Developers can refer to this file to gain a thorough understanding of leveraging UIActivityIndicatorView to enhance user experience and provide visual feedback during processing tasks.


import UIKit

class ViewController: UIViewController {
    
    var startLoadingButton = UIButton()
    // Our UIActivityIndicators will take up the whole screen for a set amount of time. That's why I need a timer to ensure it disappears after a certain amount of time, allowing the user to press the button again.
    var timer: Timer!

    // Syntax to create a UIActivityIndicatorView
    var loadCircle = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        
    }

    func configureUI(){
        configureLoadingCircle()
        configureButton()
        setUpButton()
    }
    
    // This is called in leadingBarTimer()
    func disableEverything() {
        // Since we have an activity bar, we don't want users to be able to click anywhere on the screen. This could lead the user to accidentally click on something and navigate to a different screen, possibly causing a crash, etc. This piece of code prevents user interaction.
        view.isUserInteractionEnabled = false
        // This piece of code will disable the button, causing it to grey out and become unpressable. However, it's not necessary; I included it because I like how it looks. The code above is all you really need to disable the user's ability to press on things while the loading bar is up.
        startLoadingButton.isEnabled = false
    }
    
    // This is called in the leadingBarTimer() specifically when the timer is done.
    func enableEverything() {
        // This piece of code enables user interaction again.
        view.isUserInteractionEnabled = true
        // This allows the button to become clickable again.
        startLoadingButton.isEnabled = true
    }
    
    // When the button is pressed, call this function. This starts the activity bar, timer, and eventually, when the time is up, ends the activity bar.
    @objc func loadingBarTimer() {
        startLoading()
        disableEverything()
        
        // This timer will last for 10 seconds and won't repeat.
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { timer in
            self.stopLoading()
            self.stopTimer()
            self.enableEverything()
        })

    }
    
    // Function to stop the timer, freeing up memory.
    func stopTimer() {
        timer.invalidate()
    }
    
    func configureButton() {
        startLoadingButton.configuration = .tinted()
        startLoadingButton.configuration?.baseBackgroundColor = .blue
        startLoadingButton.configuration?.buttonSize = .large
        startLoadingButton.configuration?.cornerStyle = .medium
        startLoadingButton.configuration?.title = "Start"
        startLoadingButton.configuration?.titleAlignment = .center
        startLoadingButton.configuration?.subtitle = "10 Seconds"
        
        startLoadingButton.addTarget(self, action: #selector(loadingBarTimer), for: .touchUpInside)
        
        startLoadingButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpButton() {
        view.addSubview(startLoadingButton)
        
        NSLayoutConstraint.activate([
            startLoadingButton.widthAnchor.constraint(equalToConstant: 200),
            startLoadingButton.heightAnchor.constraint(equalToConstant: 50),
            startLoadingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startLoadingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }

    func startLoading() {
        // This is how you start the activity indicator.
        loadCircle.startAnimating()
    }
    
    func stopLoading() {
        // This is how you stop the activity indicator.
        loadCircle.stopAnimating()
    }
    
    func configureLoadingCircle(){
        // This will determine if the activity indicator is visible when UIActivityIndicatorView'sName.stopAnimating() is called.
        loadCircle.hidesWhenStopped = true
        // The color that you want the activity indicator to be.
        loadCircle.color = .cyan
        // Style of the activity indicator.
        loadCircle.style = .large
        // The activity indicator itself is not very big and by default, it will appear in the middle. Depending on the constraints you set, the rest of it will have a background that you can change the color of. I prefer to have it dark to indicate that something is in progress and to suggest that you shouldn't click anywhere else.
        loadCircle.backgroundColor = .darkGray
        
        loadCircle.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the activity bar with the constraints you want.
        view.addSubview(loadCircle)
        NSLayoutConstraint.activate([
            loadCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadCircle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadCircle.topAnchor.constraint(equalTo: view.topAnchor),
            loadCircle.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    
}

