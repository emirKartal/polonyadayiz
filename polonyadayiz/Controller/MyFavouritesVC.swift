//
//  MyFavouritesVC.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 12.09.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit
import CoreData

class MyFavouritesVC: UIViewController, NavBarImageProtocol {
    
    var favouriteDepartmentArray : [LikedDepartment] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
        loadFavouriteData()
        
        
    }
    
    func loadFavouriteData() {
        
        let request : NSFetchRequest<LikedDepartment> = LikedDepartment.fetchRequest()
        do {
            favouriteDepartmentArray = try context.fetch(request)
        } catch {
            print("error \(error.localizedDescription)")
        }
        
    }

}
