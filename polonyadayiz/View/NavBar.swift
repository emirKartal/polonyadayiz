//
//  NavBar.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 19.07.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class NavBar: UINavigationBar, DropShadowProtocol {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addDropShadow()
        
    }

}
