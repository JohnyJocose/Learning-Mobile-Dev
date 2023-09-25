//
//  ViewController.swift
//  ScrollViews
//
//  Created by Johnathan Huijon on 8/27/23.
//

import UIKit

// This file provides an in-depth exploration and demonstration of implementing and utilizing UIScrollView in iOS development. UIScrollView is a powerful UIKit component that enables smooth scrolling and panning of content that exceeds the visible area. The file covers essential aspects such as setting up UIScrollView, managing content size, incorporating subviews, handling scrolling events, and addressing common challenges associated with scroll views. Developers can refer to this file to grasp the fundamentals of UIScrollView and effectively integrate it into their applications for a seamless user experience.

class ViewController: UIViewController {

    // Create a UIScrollView using this syntax
    let scrollView = UIScrollView()
    // We want to place a view in the UIScrollView so we can arrange UI elements here
    let scrollViewsView = UIView()
    
    // UI elements to be placed in the UIScrollView's view; each of these labels will be positioned at the top, middle, and bottom of the scroll view for demonstration purposes in this file
    let labelTop = UILabel()
    let labelMiddle = UILabel()
    let labelBottom = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }

    func configureUI() {
        configureScrollView()
        setUpScrollView()
        configureView()
        addLabelsToScroll()
    }
    
    func configureBottomLabel() {
        labelBottom.text = "Bottom of Scrollview!"
        labelBottom.font = .boldSystemFont(ofSize: 30)
        labelBottom.textColor = .red
        labelBottom.textAlignment = .center
        
        
        labelBottom.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureMiddlelabel() {
        labelMiddle.text = "Middle of Scrollview!"
        labelMiddle.font = .boldSystemFont(ofSize: 30)
        labelMiddle.textColor = .red
        labelMiddle.textAlignment = .center
        
        labelMiddle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureToplabel() {
        labelTop.text = "Top of Scrollview!"
        labelTop.font = .boldSystemFont(ofSize: 30)
        labelTop.textColor = .red
        labelTop.textAlignment = .center
        
        labelTop.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // We are adding the labels to their respective positions within the view placed in the UIScrollView's contentView. Placing them in the view allows interaction with them.
    func addLabelsToScroll() {
        configureToplabel()
        configureMiddlelabel()
        configureBottomLabel()
        
        // Add the view to the UIScrollView's contentView, which is added in a function below
        scrollViewsView.addSubview(labelTop)
        scrollViewsView.addSubview(labelMiddle)
        scrollViewsView.addSubview(labelBottom)
        
        NSLayoutConstraint.activate([
            labelTop.widthAnchor.constraint(equalToConstant: 300),
            labelTop.centerXAnchor.constraint(equalTo: scrollViewsView.centerXAnchor),
            labelTop.topAnchor.constraint(equalTo: scrollViewsView.topAnchor, constant: 30),
            
            labelMiddle.widthAnchor.constraint(equalToConstant: 300),
            labelMiddle.centerXAnchor.constraint(equalTo: scrollViewsView.centerXAnchor),
            labelMiddle.centerYAnchor.constraint(equalTo: scrollViewsView.centerYAnchor),
            
            labelBottom.widthAnchor.constraint(equalToConstant: 300),
            labelBottom.centerXAnchor.constraint(equalTo: scrollViewsView.centerXAnchor),
            labelBottom.bottomAnchor.constraint(equalTo: scrollViewsView.bottomAnchor, constant: -30)
        ])
        
        
    }
    
    func configureView() {
        // We need to have a view to match the content size of what we configure the UIScrollView to be. This will allow us to place things inside and enable scrolling.
        scrollViewsView.backgroundColor = .systemBackground
        scrollViewsView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollViewsView)
        
        NSLayoutConstraint.activate([
            scrollViewsView.widthAnchor.constraint(equalToConstant: scrollView.contentSize.width),
            scrollViewsView.heightAnchor.constraint(equalToConstant: scrollView.contentSize.height)
        ])
    }
    
    // Configure the scroll view
    func configureScrollView() {
        // Configure the scroll view to scroll vertically with a height matching our preference, while matching the width to be the same width as the screen it's being displayed on
        // If you want a horizontal scroll, use the same configuration, but switch the roles around, matching width as needed and setting the height to the screen's height
        scrollView.contentSize.width = view.frame.width
        scrollView.contentSize.height = 2000
        // Set the background color of the UIScrollView to pink so it's visible in the background when the view placed inside it has reached its boundary
        scrollView.backgroundColor = .systemPink
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
                
    }
    
    func setUpScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

