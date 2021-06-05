//
//  ViewModel.swift
//  ErrorHandling
//
//  Created by Gurjinder Singh on 05/06/21.
//

import Foundation

protocol ViewModelling {
    func userTest(age: Int,name:String) throws
}

class ViewModel: ViewModelling {
    func userTest(age: Int,name:String) throws  {
        guard name.count > 5 else {
            throw UserDetailError.noValidName(minChar: 5)
        }
        guard age > 18 else {
            throw UserDetailError.noValidAge
        }
    }
}
