//
//  HomeViewController.swift
//  YouTubeApp
//
//  Created by Gmeruvia on 27/7/24.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Task{
            await presenter.getHomeObjects()
        }
    }

}

extension HomeViewController : HomeViewProtocol{
    func getData(list: [[Any]]) {
        print("list: ",list)
    }
    
    
}
