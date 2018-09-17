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
    
    @IBOutlet weak var favouriteTableView: UITableView!
    
    var favouriteDepartmentArray : [LikedDepartment] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
        
        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self
        
        loadFavouriteData()
        
    }
    
    //MARK: Load data from Coredata
    
    func loadFavouriteData() {
        
        let request : NSFetchRequest<LikedDepartment> = LikedDepartment.fetchRequest()
        do {
            favouriteDepartmentArray = try context.fetch(request)
            favouriteTableView.reloadData()
        } catch {
            print("error \(error.localizedDescription)")
        }
        
    }

}

    //MARK: Tableview delegate and data source methods

extension MyFavouritesVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteDepartmentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath) as! FavouriteCell
        let item = favouriteDepartmentArray[indexPath.row]
        cell.configureFavouriteCell(university: item.universityName!, department: item.departmentName!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            context.delete(favouriteDepartmentArray[indexPath.row])
            
            favouriteDepartmentArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
            do {
                try context.save()
                
            } catch {
                print("error when removing data \(error.localizedDescription)")
            }
        }
    }
    
}
