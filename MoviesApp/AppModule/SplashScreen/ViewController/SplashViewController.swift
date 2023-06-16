//
//  SplashViewController.swift
//  MoviesApp
//
//  Created by soft xpert on 15/06/2023.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var splash:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.9, animations: {
            self.splash.layer.position.x = -50
        },completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                MoviesListRouter().navigateToMoviesListScreen()
            }
        })
     
        
    }
    
}
