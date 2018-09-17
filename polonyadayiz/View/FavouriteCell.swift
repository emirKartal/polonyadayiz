//
//  FavouriteCell.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 13.09.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var departmentLbl: UILabel!
    
    var isLiked : Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureFavouriteCell(university uniName: String , department depName: String ) {
        
        universityLbl.text = uniName
        departmentLbl.text = depName
        
    }
    
}
