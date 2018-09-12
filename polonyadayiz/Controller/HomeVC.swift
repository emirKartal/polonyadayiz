//
//  ViewController.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 22.06.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,NavBarImageProtocol {
    
    @IBOutlet weak var UniSearchBtn: HomeBtn!
    @IBOutlet weak var BestPolUniBtn: HomeBtn!
    @IBOutlet weak var sideBarView: SideBarView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var isSideBarOpen : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        //MARK: - TapGesture
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeSideBar))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        //TODO: Fix The TapGesture Bug
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        closeSideBar()
    }
    
    @IBAction func uniSearchBtnTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toUni", sender: self)
        
    }
    
    //TODO : Sign Out button should add
    @IBAction func signOutTapped(_ sender: UIButton) {
    }
    
    @IBAction func myFavouritesBtnTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMyFavouritesVC", sender: self)
        
    }
    
    @IBAction func sideBarButtonTapped(_ sender: UIBarButtonItem) {
        
        if isSideBarOpen {
            animateSideBar(constraintVal: -200)
        } else {
            animateSideBar(constraintVal: 0)
        }
        
        isSideBarOpen = !isSideBarOpen
        
    }
    
    //MARK: - TapGesture Selector

    @objc func closeSideBar() {
        
        if isSideBarOpen {
            animateSideBar(constraintVal: -200)
            isSideBarOpen = false
        }
        
    }
    
    //MARK: - Animating SideBar
    
    func animateSideBar(constraintVal : CGFloat){
        
        UIView.animate(withDuration: 0.3) {
            self.leadingConstraint.constant = constraintVal
            self.view.layoutIfNeeded()
        }
        
    }
    
}



