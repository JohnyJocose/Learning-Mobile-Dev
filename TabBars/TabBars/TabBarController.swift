//
//  TabBarController.swift
//  TabBars
//
//  Created by Johnathan Huijon on 9/20/23.
//

import UIKit

// This file represents a UITabBarController, a fundamental component in iOS development. A UITabBarController enables the creation of a tab bar interface, providing a seamless way to navigate between different sections or functionalities within an app. Each tab corresponds to a specific view controller, and when a tab is selected, it leads to a designated path of the app's navigation.

// The beauty of a UITabBarController is that each tab can have its own distinct set of view controllers, offering segregated paths of functionality. These view controllers associated with each tab are typically related to the specific content or feature represented by that tab. When a specific tab's view controller is clicked, it usually leads back to the primary view controller associated with that tab, ensuring a consistent and intuitive user experience.


class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        // In this example file, I'm configuring the view controllers to be navigation controllers, but it's important to note that they can also be regular view controllers.
        let homeNav = UINavigationController(rootViewController: HomeVC())
        // Here, we're configuring the tab bar items for each view controller.
        homeNav.tabBarItem.image = UIImage(systemName: "house.fill")
        // Additionally, we assign a text that will appear on the tab bar item.
        homeNav.tabBarItem.title = "Home"
        
        // The same process is repeated for the other paths, configuring their respective view controllers and assigning the appropriate tab bar item text.
        let searchNav = UINavigationController(rootViewController: SearchVC())
        searchNav.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle.fill")
        searchNav.tabBarItem.title = "Search"
        let profileNav = UINavigationController(rootViewController: ProfileVC())
        profileNav.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        profileNav.tabBarItem.title = "Profile"
        // It's important to note that if you set the image and title directly in the view controllers themselves, the tab bar icon and title won't appear until you click on that tab. Therefore, it's more effective to configure them here in the UITabBarController.

        
        // The view controllers are set using the `setViewControllers` method. It's crucial to carefully consider the order as it directly corresponds to the arrangement on the tab bar.
        setViewControllers([homeNav, searchNav, profileNav], animated: true)
        
        // Here, we're configuring the color that selected buttons will display.
        tabBar.tintColor = .systemPink
        // Similarly, we're setting the color that non-selected buttons will display.
        tabBar.unselectedItemTintColor = .systemCyan
    }
    
}
