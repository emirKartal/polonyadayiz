//
//  HomeBtn.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 19.07.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class HomeBtn: UIButton, DropShadowProtocol {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeHomeBtn()
        addDropShadow()
        
    }
    
    func customizeHomeBtn() {
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0).cgColor
        layer.cornerRadius = 12
        
        layer.backgroundColor = UIColor(red: 200.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        setTitleColor(UIColor.white, for: UIControlState.normal)
        
    }
    
}
