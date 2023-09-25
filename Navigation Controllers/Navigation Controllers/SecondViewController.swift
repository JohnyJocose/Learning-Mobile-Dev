//
//  SecondViewController.swift
//  Navigation Controllers
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file represents the 2nd view controller on the navigation stack. Its primary function is to provide the user with options for presenting a new view controller. These options include pushing onto the stack again, presenting modally in two forms: regular or full screen.

class SecondViewController: UIViewController {

    let congratsLabel = UILabel()
    let modallyLabel = UILabel()
    let modallyButton = UIButton()
    let modallyFullscreenLabel = UILabel()
    let modallyFullscreenButton = UIButton()
    let pushLabel = UILabel()
    let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func ButtonPressed(_ sender: UIButton) {
        // Switch to determine which button was pressed
        switch sender {
        case modallyButton:
            // When the "modally" button is pressed, executing this piece of code will present the screen from the bottom up, covering a portion of the screen rather than the entire view.
            
            // Non-full screen modal presentations provide a focused context while still allowing interaction with the underlying content. This is beneficial for presenting contextual information, user prompts, or actions that require attention but don't necessitate a complete interruption of the current workflow. Use cases include displaying supplementary details, form entries, or alerts without losing the user's context.
            present(ModallyViewController(), animated: true)
            
        case modallyFullscreenButton:
            // When the "full modally" button is pressed, executing this piece of code is crucial. Setting the modal presentation style to .fullscreen before presenting ensures that the new screen completely covers the underlying view.
            // Full-screen modal presentations provide a focused and immersive user experience by covering the entire screen. This is ideal for critical actions, tasks, or views that require the user's complete attention and temporarily suspend the current workflow. Use cases include presenting high-priority alerts, multimedia content, crucial decision-making interfaces, and scenarios like user login, where access to the previous screen is no longer needed or relevant.
            let vc = FullModallyViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        case pushButton:
            // When the "push" button is pressed, this code snippet demonstrates how to push another screen onto the navigation stack, similar to the functionality in the ViewController file.
            // Pushing a screen with navigation controllers maintains a structured navigation flow, allowing users to seamlessly move forward and backward within the app's content. This promotes an intuitive user experience, facilitates easy navigation through a hierarchy of views, and enables efficient utilization of screen space.
            navigationController?.pushViewController(PushViewController(), animated: true)
        default:
            fatalError("Button doesnt exist")
        }
    }
    
    // UI funcs
    func configureUI() {
        configureLabels()
        configureButtons()
        setUI()
    }
    
    func setUI() {
        setCongratsLabel()
        setPushLabel()
        setPushButton()
        setModalLabel()
        setModalButton()
        setFullModalLabel()
        setFullModalButton()
    }
    
    func setFullModalButton() {
        view.addSubview(modallyFullscreenButton)
        NSLayoutConstraint.activate([
            modallyFullscreenButton.centerXAnchor.constraint(equalTo: modallyFullscreenLabel.centerXAnchor),
            modallyFullscreenButton.heightAnchor.constraint(equalToConstant: 50),
            modallyFullscreenButton.widthAnchor.constraint(equalToConstant: 150),
            modallyFullscreenButton.topAnchor.constraint(equalTo: modallyFullscreenLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func setFullModalLabel() {
        view.addSubview(modallyFullscreenLabel)
        NSLayoutConstraint.activate([
            modallyFullscreenLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            modallyFullscreenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modallyFullscreenLabel.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 50)
        ])
    }
    
    func setModalButton() {
        view.addSubview(modallyButton)
        NSLayoutConstraint.activate([
            modallyButton.centerXAnchor.constraint(equalTo: modallyLabel.centerXAnchor),
            modallyButton.heightAnchor.constraint(equalToConstant: 50),
            modallyButton.widthAnchor.constraint(equalToConstant: 150),
            modallyButton.topAnchor.constraint(equalTo: modallyLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func setModalLabel() {
        view.addSubview(modallyLabel)
        NSLayoutConstraint.activate([
            modallyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modallyLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            modallyLabel.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 50)
        ])
    }
    
    func setPushButton() {
        view.addSubview(pushButton)
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: pushLabel.centerXAnchor),
            pushButton.heightAnchor.constraint(equalToConstant: 50),
            pushButton.widthAnchor.constraint(equalToConstant: 150),
            pushButton.topAnchor.constraint(equalTo: pushLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func setPushLabel() {
        view.addSubview(pushLabel)
        NSLayoutConstraint.activate([
            pushLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 70),
            pushLabel.heightAnchor.constraint(equalToConstant: 75),
            pushLabel.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    
    func setCongratsLabel() {
        view.addSubview(congratsLabel)
        NSLayoutConstraint.activate([
            congratsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            congratsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            congratsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    func configureButtons() {
        var modalConfig = modallyButton.configuration
        modalConfig = .tinted()
        modalConfig?.title = "Modally"
        modalConfig?.baseBackgroundColor = .systemGreen
        modalConfig?.baseForegroundColor = .systemGreen
        modallyButton.configuration = modalConfig
        modallyButton.addTarget(self, action: #selector(ButtonPressed(_:)), for: .touchUpInside)
        modallyButton.translatesAutoresizingMaskIntoConstraints = false
        
        var fullModalConfig = modallyFullscreenButton.configuration
        fullModalConfig = .tinted()
        fullModalConfig?.title = "Full Modally"
        fullModalConfig?.baseBackgroundColor = .systemBlue
        fullModalConfig?.baseForegroundColor = .systemBlue
        modallyFullscreenButton.configuration = fullModalConfig
        modallyFullscreenButton.addTarget(self, action: #selector(ButtonPressed(_:)), for: .touchUpInside)
        modallyFullscreenButton.translatesAutoresizingMaskIntoConstraints = false
        
        var pushConfig = pushButton.configuration
        pushConfig = .tinted()
        pushConfig?.title = "Push"
        pushConfig?.baseBackgroundColor = .systemRed
        pushConfig?.baseForegroundColor = .systemRed
        pushButton.configuration = pushConfig
        pushButton.addTarget(self, action: #selector(ButtonPressed(_:)), for: .touchUpInside)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        
    }

    func configureLabels() {
        congratsLabel.text = "Congrats you just pushed a screen onto the navigation controller!!!\n\nNotice how there\'s a button located on the top left of the screen\nThis pops the current ViewController to go back to last screen on the stack"
        congratsLabel.textAlignment = .center
        congratsLabel.numberOfLines = 0
        congratsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        modallyLabel.text = "This button will add a viewcontroller over this one (from the bottom up)\nIt's not added onto the stack!!!"
        modallyLabel.textAlignment = .center
        modallyLabel.numberOfLines = 0
        modallyLabel.font = .systemFont(ofSize: 12)
        modallyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        modallyFullscreenLabel.text = "This button will add another view controller over this one\nIt will take up the whole screen and you can not access the navigation stack anymore"
        modallyFullscreenLabel.textAlignment = .center
        modallyFullscreenLabel.numberOfLines = 0
        modallyFullscreenLabel.font = .systemFont(ofSize: 12)
        modallyFullscreenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pushLabel.text = "This push button functions exactly the same as the first screen's button.\n We're pushing a viewcontroller on the stack"
        pushLabel.textAlignment = .center
        pushLabel.numberOfLines = 0
        pushLabel.font = .systemFont(ofSize: 12)
        pushLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
