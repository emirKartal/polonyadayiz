//
//  UniDetailCell.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 16.08.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class UniDetailCell: UITableViewCell {
    @IBOutlet weak var uniDetailLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selection : Bool = false
    var likedDepartmentArray : [LikedDepartment] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeBtnTapped(_ sender: UIButton) {
        
        selection = !selection
        
        if selection {
            likeBtn.setBackgroundImage(#imageLiteral(resourceName: "liked.png"), for: .normal)
            saveDepartment()
        } else {
            likeBtn.setBackgroundImage(#imageLiteral(resourceName: "likebtn.png"), for: .normal)
            deleteDepartment()
        }
        
        
    }
    
    //MARK: Save Data to CoreData
    
    func saveDepartment() {
        
        let likedDepartment = LikedDepartment(context: self.context)
        likedDepartment.departmentName = uniDetailLabel.text
        likedDepartment.isLiked = true
        likedDepartment.universityName = "University Name" //TODO: Get University Name Here
        
        do {
            try context.save()
            likedDepartmentArray.append(likedDepartment)
        } catch {
            print("error when saving data \(error.localizedDescription)")
        }
        
        
        
    }
    
    func deleteDepartment() {
        
        let deletedArray = likedDepartmentArray.filter{$0.departmentName == uniDetailLabel.text && $0.universityName == "University Name"}
        context.delete(deletedArray[0])
        
        do {
            try context.save()
            print("Deleted")
            
        } catch {
            print("error when saving data \(error.localizedDescription)")
        }
        
        
        
    }
    
    
   

}
