//
//  UniListCell.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 6.08.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class UniListCell: UITableViewCell {

    @IBOutlet weak var universityImage: UIImageView!
    @IBOutlet weak var universityNameEng: UILabel!
    @IBOutlet weak var universityNameTur: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        /*if selected {
            universityImage.isHidden = true
        }*/
        
        
    }
    
    func configureCell(filteredArray : [University] , allUniArray : [University], indexPath : IndexPath) {
        
        if filteredArray.count == 0 {
            universityNameEng.text = allUniArray[indexPath.row].uniName
            universityNameTur.text = allUniArray[indexPath.row].uniCity
            
        } else {
            universityNameEng.text = filteredArray[indexPath.row].uniName
            universityNameTur.text = filteredArray[indexPath.row].uniCity
            
        }
        
        
    }

}
