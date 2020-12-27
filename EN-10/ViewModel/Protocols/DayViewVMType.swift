//
//  DayViewVMType.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation

protocol DayViewVMType {
    var whichDay: Int { get }
    var title: String { get }
    var listData: [String] { get }
    var importantNote: String? { get }
    var additionalInfo: String? { get }
   
}
