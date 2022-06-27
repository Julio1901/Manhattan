//
//  ViewController.swift
//  Manhattan
//
//  Created by Julio Cesar  on 25/06/22.
//

import UIKit
import Foundation


class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var coffeImage: UIImageView!
    @IBOutlet weak var coffeName: UILabel!
    @IBAction func btnRandomCoffe(_ sender: UIButton) {
        changeCoffeImage()
    }
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private let coffeViewModel = CoffeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    private func prepareCoffeImageView(){
        coffeImage.contentMode = UIView.ContentMode.scaleAspectFill
        coffeImage.layer.cornerRadius = coffeImage.frame.height / 2
        coffeImage.layer.masksToBounds = false
        coffeImage.clipsToBounds = true
    }
    
    private func changeCoffeImage(){
        coffeViewModel.randomCoffeImage()
        coffeImage.image = nil
        coffeImage.load(stringUrl: coffeViewModel.getCoffeImage())
        prepareCoffeImageView()
        
        if let randomCoffeName = coffeDrinksNames.randomElement(){
            coffeName.text = randomCoffeName
        }
        handleWithLoading()
        
    }
    
    //This method mock the behavior of loading with a listener
    private func handleWithLoading(){
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.loadingIndicator.isHidden = true
            self.loadingIndicator.stopAnimating()
        }
    }
    
}


