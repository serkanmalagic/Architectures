//
//  TableViewAdvancedViewModel.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 9.01.2022.
//

import Foundation
import UIKit
import Alamofire

struct Product {
    let name : String
    let price : String
    let description : String
    let extra : String
}

struct TableViewAdvancedViewModel {
    
    var products = [Product]()
    
}

