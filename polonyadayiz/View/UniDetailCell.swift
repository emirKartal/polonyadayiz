//
//  UniDetailCell.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 16.08.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit
import CoreData

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
        
        showImageOfLikeBtn()
        
        selection ? saveDepartment() : deleteDepartment()
        
    }
    
    func showImageOfLikeBtn() {
        if selection {
            likeBtn.setBackgroundImage(#imageLiteral(resourceName: "liked.png"), for: .normal)
        } else {
            likeBtn.setBackgroundImage(#imageLiteral(resourceName: "likebtn.png"), for: .normal)
        }
    }
    
    //MARK: Save Data to CoreData
    
    func saveDepartment() {
        
        let likedDepartment = LikedDepartment(context: self.context)
        likedDepartment.departmentName = uniDetailLabel.text
        likedDepartment.isLiked = true
        likedDepartment.universityName = UniListVC.selectedUniName
        
        do {
            try context.save()
            likedDepartmentArray.append(likedDepartment)
        } catch {
            print("error when saving data \(error.localizedDescription)")
        }
        
    }
    
    func deleteDepartment() {
        
        let deletedArray = likedDepartmentArray.filter{$0.departmentName == uniDetailLabel.text && $0.universityName == UniListVC.selectedUniName}
        context.delete(deletedArray[0])
        
        do {
            try context.save()
            
        } catch {
            print("error when saving data \(error.localizedDescription)")
        }
        
    }
    
    func checkData() {
        
        let request : NSFetchRequest<LikedDepartment> = LikedDepartment.fetchRequest()
        do {
            likedDepartmentArray = try context.fetch(request)
            
            selection = likedDepartmentArray.contains { (item) -> Bool in
                if item.departmentName == uniDetailLabel.text && item.universityName == UniListVC.selectedUniName {
                    return true
                }else {
                    return false
                }
            }
            
        } catch {
            print("error \(error.localizedDescription)")
        }
        
    }

}
