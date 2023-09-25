//
//  ViewController.swift
//  NSLayoutConstraints
//
//  Created by Johnathan Huijon on 9/20/23.
//

import UIKit

// This file delves into NSLayoutConstraint, offering insights into effectively defining and applying layout constraints for positioning and sizing UI elements. Define the layout of UI elements by setting constraints such as width, height, leading, trailing, top, bottom, centerX, and centerY to determine x and y coordinates. In some cases, leading and trailing can replace the need to set width, and top and bottom can replace the need to set height, streamlining the layout process. Align these constraints with the view or other UI elements for precise and adaptive layouts.



class ViewController: UIViewController {
    
    // For this file example, we will be using two buttons to demonstrate the implementation and application of NSLayoutConstraint for precise positioning and sizing of UI elements.
    let button1 = UIButton()
    let button2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureButton1()
        configureButton2()
        // When dealing with constraints, the order in which you set them is crucial. In this example, we demonstrate the importance of order by referencing UI elements like button1 in the setButton2 function. If setButton2 were called before setButton1, it would lead to a crash as button1 hasn't been added to the view yet.
        setButton1()
        setButton2()
    }
    
    func setButton1() {
        // To effectively set constraints, it's imperative to set translatesAutoresizingMaskIntoConstraints to false. This step is essential for the proper functioning of constraints.
        button1.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding the UI element to the view is crucial as it enables applying constraints and interaction with other UI elements.
        view.addSubview(button1)
        // To efficiently add and activate multiple constraints at once, this method provides a streamlined approach.

        // In this example, each button has its own NSLayoutConstraint for better separation and understanding of their interactions. However, you can combine both buttons into a single NSLayoutConstraint as long as the necessary setup is done for each button prior to this point.
        NSLayoutConstraint.activate([
            // This constraint sets the button's horizontal center relative to another element (in this case, the view's centerX), effectively centering the button on the screen. The constant allows fine adjustments, with a positive value shifting right and a negative value shifting left.
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            // This constraint sets the button's vertical center relative to another element (in this case, the view's centerY), effectively centering the button on the screen vertically. The constant allows fine adjustments, with a positive value shifting downwards and a negative value shifting upwards.
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            // This constraint defines the button's width, giving you control over its length based on your design requirements and preferences.
            button1.widthAnchor.constraint(equalToConstant: 250),
            
            // This constraint defines the button's height, providing control over its length based on your design preferences and requirements.

            button1.heightAnchor.constraint(equalToConstant: 50)
            
            
            // By setting x and y coordinates with center x and center y along with width and height anchors, we avoid conflicting constraints that might arise due to varying phone sizes, ensuring a flexible layout adaptable to different screen dimensions.
            // When applying constraints in a similar manner for another button, certain properties may not need to be explicitly set, demonstrating the flexibility of NSLayoutConstraint and its adaptability to different UI elements.

        ])
    }
    
    func setButton2() {
        // You can use 'tamic' as a shortcut to quickly insert the preceding comment.
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            
            // Setting the button's leading anchor determines the position of the left part of the element.
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // Setting the trailing anchor determines the position of the right part of the element.
            button2.trailingAnchor.constraint(equalTo: button1.trailingAnchor),
            
            // Setting the bottom anchor determines the position of the bottom of the element.
            // Using the safe area layout guide's bottom anchor is recommended to account for elements like tab bars or navigation bars that might already occupy the area.
            button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Setting the top anchor determines the positioning of the top of the element.
            // Setting the top anchor to the button's bottom anchor ensures appropriate positioning, avoiding potential overlap.
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 100)
            
            
            
            // When setting leading, trailing, top, and bottom anchors, it provides positional context, making explicit width and height constraints unnecessary and avoiding conflicts.
            // Note: The constraints set for button2 may not result in a visually pleasing layout like button1; this is intentional to demonstrate different interactions.
        ])
    }

    func configureButton1() {
        var config1 = button1.configuration
        config1 = .tinted()
        config1?.title = "Button 1"
        config1?.baseBackgroundColor = .systemBlue
        config1?.baseForegroundColor = .systemBlue
        config1?.buttonSize = .medium
        button1.configuration = config1
    }
    
    func configureButton2() {
        var config2 = button2.configuration
        config2 = .tinted()
        config2?.title = "Button 2"
        config2?.baseBackgroundColor = .systemRed
        config2?.baseForegroundColor = .systemRed
        config2?.buttonSize = .medium
        button2.configuration = config2
    }

}

