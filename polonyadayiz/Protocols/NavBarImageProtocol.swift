//
//  NavBarImage.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 19.07.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

protocol NavBarImageProtocol {
    
}

extension NavBarImageProtocol where Self : UIViewController {
    
    func addNavBarImage() {
        
        let controller = navigationController!
        
        let image = #imageLiteral(resourceName: "polonyadayiz-com-logo (1).png")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = controller.navigationItem.accessibilityFrame.size.width
        let bannerHeight = controller.navigationItem.accessibilityFrame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
        
 
    }
    
}


