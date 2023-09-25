//
//  ViewController.swift
//  StackViews
//
//  Created by Johnathan Huijon on 8/30/23.
//

import UIKit

// This file serves as an extensive guide to UIStackView, an essential component in iOS development for efficiently arranging and managing the layout of user interface elements. UIStackView streamlines the process of creating complex layouts, allowing for easy customization and responsiveness. The file covers core concepts such as creating and configuring stack views, managing distribution, alignment, and spacing, and incorporating nested stack views for intricate layouts.

// This Stack View will try to mimic what you would see in a social media bio layout
class ViewController: UIViewController {

    // Syntax to create a labeled Stack View, specifying its orientation, e.g., verticalStackView or horizontalStackView
    let vsProfileStructureUI = UIStackView()
    
    // Inside vsProfileStructureUI
    let hsAccountAndPic = UIStackView()
    let hsButtons = UIStackView()
    
    // Inside hsAccountAndPic
    let profilePicture = UIImageView()
    let accountInfoView = UIView()
    
    // Inside accountInfoView View
    let accountNameLabel = UILabel()
    let followingLabel = UILabel()
    let follwerLabel = UILabel()
    let followingNumLabel = UILabel()
    let followerNumLabel = UILabel()
    
    
    // Inside hsButtons
    let instagramButton = UIButton()
    let twitterButton = UIButton()
    let githubButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        placeUIElements()
    }
    
    // Placing nested Stack Views is important, as they determine the top-to-bottom order in a vertical stack and left-to-right order in a horizontal stack
    func placeUIElements() {
        placevsProfileStructureUI()
        placeHorizontalStacks()
        placeImageView()
        placeView()
        placeElementsInView()
        placeButtonsinStack()
    }
    
    // These will align the 3 buttons horiznatally
    func placeButtonsinStack() {
        hsButtons.addArrangedSubview(instagramButton)
        hsButtons.addArrangedSubview(twitterButton)
        hsButtons.addArrangedSubview(githubButton)
    }
    
    // These will place the labels in a view so that the view can be placed in the stack
    func placeElementsInView() {
        accountInfoView.addSubview(accountNameLabel)
        accountInfoView.addSubview(follwerLabel)
        accountInfoView.addSubview(followingLabel)
        accountInfoView.addSubview(followerNumLabel)
        accountInfoView.addSubview(followingNumLabel)
        
        NSLayoutConstraint.activate([
            accountNameLabel.centerXAnchor.constraint(equalTo: accountInfoView.centerXAnchor),
            accountNameLabel.topAnchor.constraint(equalTo: accountInfoView.topAnchor, constant: 8),
            
            
            followingLabel.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 8),
            followingLabel.leadingAnchor.constraint(equalTo: accountInfoView.leadingAnchor, constant: 3),
            
            
            follwerLabel.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 8),
            follwerLabel.trailingAnchor.constraint(equalTo: accountInfoView.trailingAnchor, constant: 3),
            
            
            followingNumLabel.topAnchor.constraint(equalTo: followingLabel.bottomAnchor, constant: 3),
            followingNumLabel.centerXAnchor.constraint(equalTo: followingLabel.centerXAnchor),
            
            
            followerNumLabel.topAnchor.constraint(equalTo: follwerLabel.bottomAnchor, constant: 3),
            followerNumLabel.centerXAnchor.constraint(equalTo: follwerLabel.centerXAnchor)
        ])
        
    }
    
    // Placing the view in a stack with the profile picture
    func placeView() {
        hsAccountAndPic.addArrangedSubview(accountInfoView)
        NSLayoutConstraint.activate([
            accountInfoView.heightAnchor.constraint(equalToConstant: 150),
            accountInfoView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // Placing the image in a stack view with the account info view
    func placeImageView() {
        hsAccountAndPic.addArrangedSubview(profilePicture)
        NSLayoutConstraint.activate([
            profilePicture.widthAnchor.constraint(equalToConstant: 150),
            profilePicture.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // Function to place horizontal stacks within the main vertical stack
    func placeHorizontalStacks() {
        placeAccountAndPicStack()
        placeButtonStack()
    }
    
    func placeButtonStack() {
        vsProfileStructureUI.addArrangedSubview(hsButtons)
    }
    
    func placeAccountAndPicStack() {
        vsProfileStructureUI.addArrangedSubview(hsAccountAndPic)
        
    }
    
    // Set the main vertical stack at a general location in your screen to configure the content inside it. This allows flexibility in width and height, avoiding potential constraints that may not achieve the desired look.
    func placevsProfileStructureUI() {
        view.addSubview(vsProfileStructureUI)
        
        NSLayoutConstraint.activate([
            vsProfileStructureUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vsProfileStructureUI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    // UI Func
    
    func configureUI() {
        configureProfileButtons()
        configureAccountAndPic()
        configureProfileStructureUi()
        configureButtons()
        configureLabels()
        configureAccountInfoView()
        configureProfileImage()
    }
    
    func configureProfileImage() {
        profilePicture.image = UIImage(systemName: "person.fill")
        profilePicture.tintColor = .systemBlue
        profilePicture.setContentHuggingPriority(.init(251), for: .horizontal)
        profilePicture.setContentHuggingPriority(.init(251), for: .vertical)
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureAccountInfoView() {
        accountInfoView.backgroundColor = .systemBackground
        accountInfoView.setContentHuggingPriority(.init(250), for: .horizontal)
        accountInfoView.setContentHuggingPriority(.init(250), for: .vertical)
        accountInfoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLabels() {
        accountNameLabel.text = "Account Name"
        accountNameLabel.font = .boldSystemFont(ofSize: 20)
        accountNameLabel.textAlignment = .center
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        follwerLabel.text = "Followers"
        follwerLabel.font = .systemFont(ofSize: 15)
        follwerLabel.textAlignment = .center
        follwerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        followingLabel.text = "Following"
        followingLabel.font = .systemFont(ofSize: 15)
        followingLabel.textAlignment = .center
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        followerNumLabel.text = "10"
        followerNumLabel.font = .systemFont(ofSize: 14)
        followerNumLabel.textAlignment = .center
        followerNumLabel.translatesAutoresizingMaskIntoConstraints = false
        
        followingNumLabel.text = "25"
        followingNumLabel.font = .systemFont(ofSize: 14)
        followingNumLabel.textAlignment = .center
        followingNumLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureButtons() {
        
        var instaConfig = instagramButton.configuration
        instaConfig = .plain()
        instaConfig?.title = "Instagram"
        instaConfig?.baseForegroundColor = .systemBlue
        instagramButton.configuration = instaConfig
        instagramButton.translatesAutoresizingMaskIntoConstraints = false
        
        var twitterConfig = twitterButton.configuration
        twitterConfig = .plain()
        twitterConfig?.title = "Twitter"
        twitterConfig?.baseForegroundColor = .systemBlue
        twitterButton.configuration = twitterConfig
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        
        var githubConfig = githubButton.configuration
        githubConfig = .plain()
        githubConfig?.title = "Github"
        githubConfig?.baseForegroundColor = .systemBlue
        githubButton.configuration = githubConfig
        githubButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureProfileStructureUi() {
        vsProfileStructureUI.axis = .vertical
        vsProfileStructureUI.alignment = .center
        vsProfileStructureUI.distribution = .equalSpacing
        vsProfileStructureUI.spacing = 15
        vsProfileStructureUI.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureAccountAndPic() {
        hsAccountAndPic.axis = .horizontal
        hsAccountAndPic.alignment = .center
        hsAccountAndPic.distribution = .fillProportionally
        hsAccountAndPic.spacing = 24
        hsAccountAndPic.setContentHuggingPriority(.init(251), for: .horizontal)
        hsAccountAndPic.setContentHuggingPriority(.init(251), for: .vertical)
        
        hsAccountAndPic.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureProfileButtons() {
        hsButtons.axis = .horizontal
        hsButtons.alignment = .center
        hsButtons.distribution = .equalSpacing
        hsButtons.spacing = 15
        hsButtons.setContentHuggingPriority(.init(250), for: .horizontal)
        hsButtons.setContentHuggingPriority(.init(250), for: .vertical)
        hsButtons.translatesAutoresizingMaskIntoConstraints = false
    }
    


}

