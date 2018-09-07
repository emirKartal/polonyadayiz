//
//  DataService.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 2.08.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    
    static let instance = DataService()
    
    var universityArray : [University] = []
    var departmentArray : [Department] = []
    var universityDictionary : [String:Int] = [:]
    
    func loadUniversities() {
        
        Database.database().reference().child("university").observe(.value) { (snapshot) in
            let values = snapshot.value as! NSDictionary
            let uniCode = values.allKeys
            
            for uni in uniCode {
                
                let currentUni = values[uni] as! NSDictionary
                
                self.universityArray.append(University(uniID: currentUni["id"] as! Int, uniName: currentUni["name"] as! String, uniCity: currentUni["city"] as! String, uniField: currentUni["section"] as! String))
                
                self.universityDictionary["\(uni)"] = currentUni["id"] as? Int
                
            }
        }
        sleep(1) 
    }
    
    func getDepartments (uniid : Int) {
        
        var uniCode = ""
        for (key,value) in universityDictionary {
            if value == uniid {
                uniCode = key
            }
        }
        
        Database.database().reference().child("university").child(uniCode).child("departments").observe(.value) { (snapshot) in
            
            let departments = snapshot.value as! NSDictionary
            let depShortCut = departments.allKeys
            
            for dep in depShortCut {
                
                let currentDep = departments[dep] as! NSDictionary
                
                self.departmentArray.append(Department(departmentID: currentDep["depid"] as! Int, departmentName: currentDep["depname"] as! String, uniID: currentDep["uniid"] as! Int, departmentSection: currentDep["language"] as! String))
                
            }
        }
    }
}
