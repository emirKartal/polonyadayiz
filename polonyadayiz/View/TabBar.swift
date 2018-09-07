//
//  TabBar.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 7.08.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class TabBar: UITabBar, DropShadowProtocol{

    override func awakeFromNib() {
        super.awakeFromNib()
        
        addDropShadow()
        
    }
    
   
}
