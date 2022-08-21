//
//  HomeView.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 18/08/22.
//  
//

import Foundation
import UIKit

class HomeView:  UITabBarController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle
    var navBar: UINavigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tv Shows"
        configuareUi()
        self.setCustomNavBarView()
        presenter?.viewDidLoad()
    }
    
    
    func configuareUi(){
            navigationItem.titleView?.backgroundColor = .yellow
        
            view.backgroundColor = .white
            
            let vc1 = TvShowsWireFrame.createTvShowsModule()
            let vc2 = SecondViewController()
            
            vc1.title = "Show"
            vc2.title = "Favorites"
            
            self.setViewControllers([vc1,vc2], animated: true)
        self.tabBar.backgroundColor = .systemGray4
            guard let items = self.tabBar.items else { return }
            let images = ["rectangle.stack.fill","star.fill"]
            for x in 0..<items.count {
                items[x].image = UIImage(systemName: images[x])
            }
         
        }
    
    func setCustomNavBarView() {
           self.navBar.frame = CGRect(x: 0, y: 0, width: 350, height: 70)
           self.navBar.backgroundColor = UIColor.purple
           navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
           self.view.addSubview(navBar)
       }
    }


extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}


class SecondViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        
    }
}

