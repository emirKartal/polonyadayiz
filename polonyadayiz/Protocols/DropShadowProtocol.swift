//
//  DropShadowProtocol.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 19.07.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

protocol DropShadowProtocol {
}

extension DropShadowProtocol where Self : UIView {
    
    func addDropShadow () {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
        
    }
    
}
