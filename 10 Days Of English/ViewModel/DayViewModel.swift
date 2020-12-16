//
//  DayViewModel.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation

class DayViewModel: DayViewVMType {
    var day: Day
    
    var whichDay: Int {
        return day.whichDay
    }
    
    var title: String {
        return day.title
    }
    
    init(day: Day) {
        self.day = day
    }
    
    var listData: [String] {
        return day.listData
    }
    
    var importantNote: String? {
        return day.importantNote ?? nil
    }
    
    var additionalInfo: String? {
        return day.additionalInfo ?? nil
    }

}
