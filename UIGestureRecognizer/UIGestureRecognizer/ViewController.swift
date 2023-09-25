//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file delves into Gesture Recognition, a fundamental aspect of interactive user experiences. Gesture recognition enables applications to respond to user input beyond traditional taps and clicks. Understanding and implementing different gestures enhances the app's intuitiveness and usability.

// By understanding and implementing these various gestures, developers can tailor the app's interactions to provide an intuitive and engaging user experience, catering to a wide range of user preferences and needs.

class ViewController: UIViewController {

    let gesturePad = UIView()
    let gestureTypesLabel = UILabel()
    let gestureTypeString = "TYPES OF GESTURES:\nTap Gestures\nPinch Gestures\nRotation Gesture\nSwipe Gesture\nPan Gesture\nLongpress Gesture\nScreen Edge Pan Gesture\n\nPractice Below"
    let actionPerformed = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
        configureGesturePad()
        configureActionPerformedLabel()
        addGestures2View()
    }
    
    @objc func gesturePerformed(_ sender: UIGestureRecognizer) {
        switch sender {
        case is UITapGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nTap Gesture"
        case is UIPinchGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nPinch Gesture"
        case is UIRotationGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nRotation Gesture"
        case is UISwipeGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nSwipe Gesture"
        case is UIPanGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nPan Gesture"
        case is UILongPressGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nLongPress Gesture"
        case is UIScreenEdgePanGestureRecognizer:
            actionPerformed.text = "Performed Gesture: \nScreen Edge Pan Gesture"
        default:
            actionPerformed.text = "Error"
        }
    }
    
    func addGestures2View() {
        // Tap Gestures:
        // Utilize tap gestures to trigger actions upon a simple tap, such as opening a menu or navigating to a new screen.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        tapGesture.numberOfTapsRequired = 1
        gesturePad.addGestureRecognizer(tapGesture)
        
        // Pinch Gestures:
        // Implement pinch gestures for zooming in and out functionalities, commonly used in applications like maps or image viewers.
        // Additionally, during development, use the control button on the keyboard in conjunction with gestures to simulate user interactions on the app simulator, aiding in testing and refining gesture-based functionalities.
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        gesturePad.addGestureRecognizer(pinchGesture)
        
        // Rotation Gesture:
        // Utilize rotation gestures to allow users to rotate elements, useful for applications involving image manipulation or 3D modeling.
        // During development, utilize the option and shift keys on the keyboard in combination with gestures to simulate user interactions on the app simulator, facilitating testing and refinement of gesture-based functionalities.
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        gesturePad.addGestureRecognizer(rotationGesture)
        
        // Swipe Gesture:
        // Implement swipe gestures to enable actions like navigating between pages or dismissing elements with a swipe, enhancing the app's navigation and fluidity. It's important to note that for each swipe, you need to specify its direction—whether it's left, right, up, or down—based on the intended action and user experience.
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        leftSwipeGesture.direction = .left
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        rightSwipeGesture.direction = .right
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        upSwipeGesture.direction = .up
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        downSwipeGesture.direction = .down
        gesturePad.addGestureRecognizer(leftSwipeGesture)
        gesturePad.addGestureRecognizer(rightSwipeGesture)
        gesturePad.addGestureRecognizer(upSwipeGesture)
        gesturePad.addGestureRecognizer(downSwipeGesture)
        
        // Pan Gesture:
        // Utilize pan gestures for dragging and moving elements within the interface, enhancing interactive elements like draggable views or rearranging items. A pan gesture involves holding and dragging an element, providing a more versatile interaction compared to swipe gestures. In this example, to demonstrate both swipe and pan gestures, we've configured it to require two fingers for the gesture to be registered.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        // This is how you set the minimum number of touches required to perform the gesture.
        panGesture.minimumNumberOfTouches = 2
        gesturePad.addGestureRecognizer(panGesture)
        
        // Longpress Gesture:
        // Implement longpress gestures to trigger actions when the user presses and holds on an element for an extended period, useful for context menus or deleting items.
        let longpressGesture = UILongPressGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        longpressGesture.minimumPressDuration = 2
        gesturePad.addGestureRecognizer(longpressGesture)
        
        // Screen Edge Pan Gesture:
        // Utilize screen edge pan gestures to trigger actions when the user swipes from the edge of the screen, providing quick access to specific features like sliding menus.
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(gesturePerformed(_:)))
        screenEdgePanGesture.edges = .all
        view.addGestureRecognizer(screenEdgePanGesture)

    }
    
    func configureActionPerformedLabel() {
        actionPerformed.text = "Performed Gesture: \n"
        actionPerformed.textAlignment = .center
        actionPerformed.numberOfLines = 2
        actionPerformed.font = .boldSystemFont(ofSize: 20)
        actionPerformed.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(actionPerformed)
        NSLayoutConstraint.activate([
            actionPerformed.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            actionPerformed.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionPerformed.topAnchor.constraint(equalTo: gesturePad.bottomAnchor, constant: 10)
        ])
    }
    
    func configureGesturePad() {
        gesturePad.layer.cornerRadius = 4
        gesturePad.layer.borderWidth = 4
        gesturePad.layer.borderColor = UIColor.gray.cgColor
        gesturePad.clipsToBounds = true
        gesturePad.backgroundColor = .systemCyan
        
        
        // For some elements where you attach a gesture recognizer, you may need to enable user interaction explicitly. However, in this file, for the UIViews we're using, enabling user interaction is not necessary.
        
        //gesturePad.isUserInteractionEnabled = true
        
        
        gesturePad.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gesturePad)
        NSLayoutConstraint.activate([
            gesturePad.heightAnchor.constraint(equalToConstant: 250),
            gesturePad.widthAnchor.constraint(equalToConstant: 300),
            gesturePad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gesturePad.topAnchor.constraint(equalTo: gestureTypesLabel.bottomAnchor, constant: 20)
        ])
    }
    
    func configureLabel() {
        gestureTypesLabel.text = gestureTypeString
        gestureTypesLabel.textAlignment = .center
        gestureTypesLabel.numberOfLines = 0
        gestureTypesLabel.font = .boldSystemFont(ofSize: 29)
        gestureTypesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gestureTypesLabel)
        NSLayoutConstraint.activate([
            gestureTypesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gestureTypesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gestureTypesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
}

