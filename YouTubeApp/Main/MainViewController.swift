//
//  MainViewController.swift
//  YouTubeApp
//
//  Created by Gmeruvia on 27/7/24.
//

import UIKit

class MainViewController: UIViewController {

    var rootPageViewController : RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRoot = self
            rootPageViewController = destination
        }
    }

}

extension MainViewController : RootPageProtocol {
    func currentPage(_ index: Int) {
        print("currentPage: ",index)
    }
    
    
}
