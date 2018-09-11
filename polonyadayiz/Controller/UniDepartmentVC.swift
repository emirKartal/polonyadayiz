//
//  UniDepartmentVC.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 7.08.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit

class UniDepartmentVC: UIViewController, NavBarImageProtocol {
    
    @IBOutlet weak var departmentTableView: UITableView!
    
    
    var departmentArray : Array<Department> = []
    var sections  = ["English Bachelor","English Master","English Doctorate","Polish Bachelor","Polish Master","Polish Doctorate"]
    var separatedDepartment = [["English Bachelor":[String]()],["English Master":[String]()],["English Doctorate":[String]()],["Polish Bachelor":[String]()],["Polish Master":[String]()],["Polish Doctorate":[String]()]]
    
    var uniID = Int()
    var ds: DataService = DataService.instance

    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
        departmentTableView.delegate = self
        departmentTableView.dataSource = self
        
        uniID = UniListVC.selectedUniID
        self.navigationItem.title = UniListVC.selectedUniName
        
        ds.departmentArray.forEach { (department) in
            if department.uniID == uniID {
                departmentArray.append(department)
                
                if department.departmentSection == "English Bachelor" {
                    separatedDepartment[0]["English Bachelor"]?.append(department.departmentName)
                }
                if department.departmentSection == "English Master" {
                    separatedDepartment[1]["English Master"]?.append(department.departmentName)
                }
                if department.departmentSection == "English Doctorate" {
                    separatedDepartment[2]["English Doctorate"]?.append(department.departmentName)
                }
                if department.departmentSection == "Polish Master" {
                    separatedDepartment[3]["Polish Bachelor"]?.append(department.departmentName)
                }
                if department.departmentSection == "Polish Bachelor" {
                    separatedDepartment[4]["Polish Master"]?.append(department.departmentName)
                }
                if department.departmentSection == "Polish Doctorate" {
                    separatedDepartment[5]["Polish Doctorate"]?.append(department.departmentName)
                }
                
            }
        }
    }
}

extension UniDepartmentVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 200.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        
        let headerLabel = UILabel()
        headerLabel.text = sections[section]
        headerLabel.textColor = UIColor.white
        headerLabel.frame = CGRect(x: 100, y: 5, width: 200, height: 30)
        headerLabel.textAlignment = .center
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return separatedDepartment[0]["English Bachelor"]!.count
        case 1:
            return separatedDepartment[1]["English Master"]!.count
        case 2:
            return separatedDepartment[2]["English Doctorate"]!.count
        case 3:
            return separatedDepartment[3]["Polish Bachelor"]!.count
        case 4:
            return separatedDepartment[4]["Polish Master"]!.count
        case 5:
            return separatedDepartment[5]["Polish Doctorate"]!.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "departmentCell") as! UniDetailCell
        
        switch indexPath.section {
        case 0:
            cell.uniDetailLabel?.text = separatedDepartment[0]["English Bachelor"]?[indexPath.row]
        case 1:
            cell.uniDetailLabel?.text = separatedDepartment[1]["English Master"]?[indexPath.row]
        case 2:
            cell.uniDetailLabel?.text = separatedDepartment[2]["English Doctorate"]?[indexPath.row]
        case 3:
            cell.uniDetailLabel?.text = separatedDepartment[3]["Polish Bachelor"]?[indexPath.row]
        case 4:
            cell.uniDetailLabel?.text = separatedDepartment[4]["Polish Master"]?[indexPath.row]
        case 5:
            cell.uniDetailLabel?.text = separatedDepartment[5]["Polish Doctorate"]?[indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
