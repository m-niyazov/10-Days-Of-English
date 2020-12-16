//
//  File.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation

protocol MenuControllerVMType: class {
    var numberOfRows: Int { get }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) ->  MenuOptionCellVMType
    
    func viewModelForSelectedRow() -> DayViewVMType?
    
    func selectRow(atIndexPath indexPath: IndexPath)
}
