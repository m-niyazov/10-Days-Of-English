//
//  HomeControllerViewModel.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 27.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation

class HomeControllerViewModel: HomeControllerVMType {
    private var day: Day
    var days: [Day]
    
    init(days: [Day], withSelectedDay whichDay: Int = 0) {
        self.days = days
        self.day = days[whichDay]
    }
    
    var whichDay: Int {
        return day.whichDay
    }
    
    func generateMenuControllerViewModel() -> MenuControllerVMType {
          return MenuControllerViewModel(days: days)
      }
    
    func generateDayViewModel() -> DayViewVMType {
        return DayViewModel(day: self.day)
    }
    
}
