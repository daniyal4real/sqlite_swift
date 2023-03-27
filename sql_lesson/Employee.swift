//
//  Employee.swift
//  sql_lesson
//
//  Created by dan on 27.03.2023.
//

import Foundation


class Employee
{
      
    var name: String = ""
    var age: Int = 0
    var id: Int = 0
      
    init(id:Int, name:String, age:Int)
    {
        self.id = id
        self.name = name
        self.age = age
    }
}  
