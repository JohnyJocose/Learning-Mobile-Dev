//
//  ViewController.swift
//  TabBars
//
//  Created by Johnathan Huijon on 9/20/23.
//

// This file serves as the base view controller. While the tab bar can be set as the initial controller in the scene delegate file, for this example, we've chosen not to do so.
// The majority of the UITabBarController code resides in the TabBarController file. Here, a small portion is located in the buttonPressed function, which presents the tab bar modally and in full screen.
// If you have any questions about other items referred to here, please refer to other projects in this repository for more details.
import UIKit

class ViewController: UIViewController {

    let logInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureButton()
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func configureButton() {
        var config = logInButton.configuration
        config = .tinted()
        config?.title = "Log In"
        config?.baseBackgroundColor = .systemBlue
        config?.baseForegroundColor = .systemBlue
        logInButton.configuration = config
        logInButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: 250),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }


}

