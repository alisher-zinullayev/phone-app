//
//  MainTabBarViewController.swift
//  PhoneApp
//
//  Created by Alisher Zinullayev on 05.07.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: ProductsViewController())
        let vc2 = UINavigationController(rootViewController: AboutUsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc2.tabBarItem.image = UIImage(systemName: "info.circle.fill")
        
        vc1.title = "Products"
        vc2.title = "About Us"
        
        tabBar.tintColor = .systemCyan
        tabBar.backgroundColor = .white
        
        setViewControllers([vc1, vc2], animated: true)
        
    }

}
