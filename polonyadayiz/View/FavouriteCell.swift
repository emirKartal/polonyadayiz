//
//  FavouriteCell.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 13.09.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var departmentLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func LikeBtnTapped(_ sender: UIButton) {
        
    }
    func configureFavouriteCell(university uniName: String , department depName: String ) {
        
        universityLbl.text = uniName
        departmentLbl.text = depName
        
    }
    
    
}
