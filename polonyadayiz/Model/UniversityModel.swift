//
//  File.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 22.06.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import Foundation

struct University {
    
    private var _uniID : Int
    private var _uniName : String
    private var _uniCity : String
    private var _uniField : String
    
    var uniID : Int {
        return _uniID
    }
    var uniName : String {
        return _uniName
    }
    var uniCity : String {
        return _uniCity
    }
    var uniField : String {
        return _uniField
    }
    
    init(uniID : Int, uniName : String, uniCity : String, uniField : String) {
        
        self._uniID = uniID
        self._uniName = uniName
        self._uniCity = uniCity
        self._uniField = uniField
        
    }
    
}

struct Department {
    
    private var _departmentID : Int
    private var _departmentName : String
    private var _uniID : Int
    private var _departmentSection : String
    
    var departmentID : Int {
        return _departmentID
    }
    var departmentName : String {
        return _departmentName
    }
    var uniID : Int {
        return _uniID
    }
    var departmentSection : String {
        return _departmentSection
    }
    
    init(departmentID : Int, departmentName : String, uniID : Int, departmentSection : String) {
       
        self._departmentID = departmentID
        self._departmentName = departmentName
        self._uniID = uniID
        self._departmentSection = departmentSection
        
    }
    
}
