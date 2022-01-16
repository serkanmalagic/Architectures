//
//  RootViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import UIKit

class RootViewController: UITabBarController, UITabBarControllerDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        
        let vcFetch = TodoViewController()
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "otherImage.png"))
        vcFetch.tabBarItem = icon1
        
        let vcAdd = TodoAddViewController()
        let icon2 = UITabBarItem(title: "Add", image: UIImage(named: "add"), selectedImage: UIImage(named: "add"))
        vcAdd.tabBarItem = icon2
        
        let vcDelete = Collection2RowsViewController()
        let icon3 = UITabBarItem(title: "Coll2Row", image: UIImage(named: "delete"), selectedImage: UIImage(named: "delete"))
        vcDelete.tabBarItem = icon3
        
        let tableViewAdvancedVc = TableViewAdvanced2ViewController()
        let icon4 = UITabBarItem(title: "TableView", image: UIImage(named: "table"), selectedImage: UIImage(named: "table"))
        tableViewAdvancedVc.tabBarItem = icon4
        
        
        

        let controllers = [vcFetch, vcAdd, vcDelete, tableViewAdvancedVc]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
