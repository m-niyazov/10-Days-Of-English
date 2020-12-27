//
//  MenuOptionCellViewModel.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation


class MenuOptionCellViewModel: MenuOptionCellVMType {
    var day: Day
    
    init(day: Day) {
          self.day = day
      }
    
    var whichDay: Int {
        return day.whichDay
    }
    
    var title: String {
        return day.title
    }
}
