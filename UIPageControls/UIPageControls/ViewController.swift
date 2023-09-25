//
//  ViewController.swift
//  UIPageControls
//
//  Created by Johnathan Huijon on 8/27/23.
//

import UIKit

// Description: This file provides implementation and usage guidance for UIPageControl, a UI element used to display and navigate through multiple pages of content. UIPageControl allows easy management of page navigation by indicating the current page and enabling users to move between pages in a visually intuitive manner.

class ViewController: UIViewController {

    // Syntax to create a UIPageControl
    let pageControl = UIPageControl()
    // The current page of the UIPageControl will be determined by the position in the scroll view.
    let colorScrolView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }


    func configureUI() {
        configureScrollView()
        configurePageControl()
        setUpPageControl()
    }
    
    // Configure the view for paging, disable bouncing, and set its width to fit 5 UIViews.
    func configureScrollView() {
        colorScrolView.contentSize.width = view.frame.width * 5
        colorScrolView.contentSize.height = view.frame.height
        // This allows scrolling beyond the bounds of the scroll view.
        colorScrolView.bounces = false
        // Enabling paging will snap the scroll view to one of the views and prevent stopping in between them.
        colorScrolView.isPagingEnabled = true
        
        colorScrolView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(colorScrolView)
        
        NSLayoutConstraint.activate([
            colorScrolView.leftAnchor.constraint(equalTo: view.leftAnchor),
            colorScrolView.rightAnchor.constraint(equalTo: view.rightAnchor),
            colorScrolView.topAnchor.constraint(equalTo: view.topAnchor),
            colorScrolView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // List of UIViews that will act as pages, with each sized to fit a screen.
        let pages: [UIView] = [UIView(), UIView(), UIView(), UIView(), UIView()]
        
        // We need this to set a color for each of these view controllers to differentiate them.
        let colors: [UIColor] = [
            .systemCyan,
            .systemMint,
            .systemPink,
            .systemIndigo,
            .systemBrown
        ]
        
        // For loop to add pages to the scroll view, assigning colors and numbers for visualization of the scrolling in this file example.
        for pageCount in 0..<pages.count {
            
            let label = UILabel()
            label.text = "\(pageCount)"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            pages[pageCount].backgroundColor = colors[pageCount]
            pages[pageCount].translatesAutoresizingMaskIntoConstraints = false

            colorScrolView.addSubview(pages[pageCount])

            if pageCount != 0 && pageCount != pages.count - 1 {
                NSLayoutConstraint.activate([

                    pages[pageCount].widthAnchor.constraint(equalToConstant: view.frame.width),
                    pages[pageCount].heightAnchor.constraint(equalToConstant: view.frame.height),
                    pages[pageCount].leftAnchor.constraint(equalTo: pages[pageCount - 1].rightAnchor)

                ])
            }
            
            else if pageCount == pages.count - 1 {
                NSLayoutConstraint.activate([

                    pages[pageCount].widthAnchor.constraint(equalToConstant: view.frame.width),
                    pages[pageCount].heightAnchor.constraint(equalToConstant: view.frame.height),
                    pages[pageCount].leftAnchor.constraint(equalTo: pages[pageCount - 1].rightAnchor),
                    pages[pageCount].rightAnchor.constraint(equalTo: colorScrolView.rightAnchor)

                ])
            }
            else {
                NSLayoutConstraint.activate([

                    pages[pageCount].widthAnchor.constraint(equalToConstant: view.frame.width),
                    pages[pageCount].heightAnchor.constraint(equalToConstant: view.frame.height),
                    pages[pageCount].leftAnchor.constraint(equalTo: colorScrolView.leftAnchor)
                ])
            }
            pages[pageCount].addSubview(label)
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 300),
                label.centerXAnchor.constraint(equalTo: pages[pageCount].centerXAnchor),
                label.centerYAnchor.constraint(equalTo: pages[pageCount].centerYAnchor)
            ])

        }
        
        // Set scroll view delegate to self to access functions for it, as demonstrated below.
        colorScrolView.delegate = self
    }
    
    // Move the scroll view to the position corresponding to the selected page.
    @objc func pageControlChanged(_ sender:UIPageControl) {
        let currentPage = sender.currentPage
        colorScrolView.setContentOffset(.init(x: CGFloat(currentPage) * view.frame.width, y: 0), animated: true)
    }
    
    // Configure the page control.
    func configurePageControl() {
        // Set the number of pages for the page control.
        pageControl.numberOfPages = 5
        // You can also set the initial page for the page control.
        pageControl.currentPage = 0
        // You can change the tint color of the current page indicator in the page control.
        pageControl.currentPageIndicatorTintColor = .systemYellow
        // You can change the tint color of the non-selected page indicators in the page control.
        pageControl.pageIndicatorTintColor = .gray
        // You can change the images of the symbols for the pages in the page control.
        pageControl.preferredIndicatorImage = UIImage(systemName: "star.fill")
        
        // You can add an action to the page control; here, we have it set to trigger the pageControlChanged function every time the value is changed. This function will move the scroll view to the appropriate position based on the selected page.
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // Place the page control in the view.
    func setUpPageControl() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalToConstant: 150),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

// Functions available when adding UIScrollViewDelegate to the view controller.
extension ViewController: UIScrollViewDelegate {
    
    // This function is called every time we scroll in the scroll view. Here, we update the page control to match where we are in the scroll view.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(colorScrolView.contentOffset.x)) / Float(colorScrolView.frame.width))
    }
}
