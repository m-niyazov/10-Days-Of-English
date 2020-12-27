//
//  HomeControllerVMType.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 27.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation


protocol HomeControllerVMType {
     var whichDay: Int { get }
     var days: [Day] { get }
     func generateDayViewModel() -> DayViewVMType
     func generateMenuControllerViewModel() -> MenuControllerVMType
    
}
