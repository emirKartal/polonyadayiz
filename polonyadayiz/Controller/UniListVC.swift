//
//  UniListVC.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 19.07.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UniListVC: UIViewController, NavBarImageProtocol {
    
    //MARK: - Filter Buttons
    @IBOutlet var departmentButtons: [UIButton]!
    @IBOutlet weak var departmentSelection: FilterBtn!
    @IBOutlet var degreeButtons: [FilterBtn]!
    @IBOutlet weak var degreeSelection: FilterBtn!
    @IBOutlet var cityButtons: [UIButton]!
    @IBOutlet weak var citySelection: FilterBtn!
    
    //MARK: - Table View
    @IBOutlet weak var universityTableView: UITableView!
    
    //MARK: - Variables
    var selectedDepartment : Variable<String> = Variable("")
    var selectedCity : Variable<String> = Variable("")
    var selectedDegree : Variable<String> = Variable("")
    
    static var selectedUniID = Int()
    static var selectedUniName = String()
    var ds: DataService = DataService.instance
    var filteredUniArray : Variable<[University]> = Variable([])
    var allUniArray : Variable<[University]> = Variable([])
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
        universityTableView.delegate = self
        universityTableView.dataSource = self
        
        allUniArray.value = ds.universityArray
        
        universityTableView.separatorColor = UIColor.red
        
        //MARK: Observing Values
        
        Observable.combineLatest(allUniArray.asObservable(),
                                 selectedDepartment.asObservable(),
                                 selectedCity.asObservable(),
                                 selectedDegree.asObservable(),
                                 resultSelector : { currenUni , department , city , degree in
                                    return currenUni.filter { uni -> Bool in
                                        return self.filterUniversities(degree: degree, city: city, department: department, uni: uni)
                                    }
        }).bind(to: filteredUniArray).disposed(by: disposeBag)

        filteredUniArray.asObservable().subscribe { value in
            self.universityTableView.reloadData()
        }.disposed(by: disposeBag)
        
        
        
    }

    @IBAction func handleSelection(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            dropDownMenuDisplay(buttonArray: departmentButtons)
        case 2:
            dropDownMenuDisplay(buttonArray: degreeButtons)
        case 3:
            dropDownMenuDisplay(buttonArray: cityButtons)
        default:
            return
        }
        
    }
    
    @IBAction func filterElementsTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 4:
            
            if let title = sender.titleLabel?.text {
                departmentSelection.setTitle(title, for: .normal)
                selectedDepartment.value = title
                
            }
            dropDownMenuDisplay(buttonArray: departmentButtons)
            
        case 5:
            
            if let title = sender.titleLabel?.text {
                degreeSelection.setTitle(title, for: .normal)
                selectedDegree.value = title
            }
            dropDownMenuDisplay(buttonArray: degreeButtons)
            
        case 6:
            
            if let title = sender.titleLabel?.text {
                citySelection.setTitle(title, for: .normal)
                selectedCity.value = title
            }
            dropDownMenuDisplay(buttonArray: cityButtons)
            
        default:
            return
        }
        
        
    }
    
    @IBAction func refreshFilter(_ sender: UIBarButtonItem) {
        
        filteredUniArray.value = []
        selectedCity.value = ""
        selectedDegree.value = ""
        selectedDepartment.value = ""
        citySelection.setTitle("Select a City", for: .normal)
        degreeSelection.setTitle("Select a Degree", for: .normal)
        departmentSelection.setTitle("Select a Department", for: .normal)
        
    }
    
    //MARK: - Filtering Universities
    
    func filterUniversities(degree : String , city : String , department : String , uni : University ) -> Bool {
        
        if filteredUniArray.value.count == 0 {
            if uni.uniField == department || uni.uniCity == city {
                
                return true
            }
            
        } else {
            
            if (uni.uniField == department && uni.uniCity == city)  {
                return true
            }
            
            if (uni.uniField == department && selectedCity.value == "" ) || (uni.uniCity == city && selectedDepartment.value == "") {
                return true
            }
            return false
        }
        
        return false
    }
    
    //MARK: DropDown Menu Display
    
    func dropDownMenuDisplay(buttonArray: [UIButton]) {
        
        buttonArray.forEach { (button) in
            UIView.animate(withDuration: 0.4, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
}
extension UniListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUniArray.value.count == 0 ? allUniArray.value.count : filteredUniArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universityCell") as! UniListCell
        
        cell.configureCell(filteredArray: filteredUniArray.value, allUniArray: allUniArray.value, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if filteredUniArray.value.count == 0 {
            adjustSelectedTableCell(allUniArray, indexPath: indexPath)
        } else {
            adjustSelectedTableCell(filteredUniArray, indexPath: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toUniDetail", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //MARK: - TableView Selected Row Function
    // ** The function gets values of selected university id in order to send it UniDepartmentVC
    // **  The function prevents adding same departments again and again thanks to the isContain variable
    
    func adjustSelectedTableCell(_ universityArray: Variable<[University]>, indexPath: IndexPath) {
        
        UniListVC.selectedUniName = universityArray.value[indexPath.row].uniName
        UniListVC.selectedUniID = universityArray.value[indexPath.row].uniID
        
        let isContain = ds.departmentArray.contains { (dep) -> Bool in
            if dep.uniID == UniListVC.selectedUniID {
                return true
            }
            return false
        }
        if isContain == false {
            ds.getDepartments(uniid: UniListVC.selectedUniID)
        }
        
    }
    
}

