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
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath)
        
        cell.textLabel?.text = favouriteDepartmentArray[indexPath.row].departmentName
        cell.detailTextLabel?.text = favouriteDepartmentArray[indexPath.row].universityName
        
        return cell
    }
    
    
}
