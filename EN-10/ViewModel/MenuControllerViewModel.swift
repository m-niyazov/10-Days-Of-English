//
//  MenuControllerViewModel.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation

class MenuControllerViewModel: MenuControllerVMType {
    
    var days: [Day]
    var selecetedIndexPath: IndexPath?
    
    var numberOfRows: Int {
        return days.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MenuOptionCellVMType {
        let day = days[indexPath.row]
        return MenuOptionCellViewModel(day: day)
    }
    
    init(days: [Day]) {
        
        self.days = days
        
    }
    
    func viewModelForSelectedRow() -> HomeControllerVMType? {
        guard let selecetedIndexPath = selecetedIndexPath else { return nil }
        return HomeControllerViewModel(days: days, withSelectedDay: selecetedIndexPath.row)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selecetedIndexPath = indexPath
    }
    
}
