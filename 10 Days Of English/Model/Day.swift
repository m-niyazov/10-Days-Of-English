//
//  Day.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation


struct Day {
    var whichDay: Int
    var title: String
    var listData: [String]
    var importantNote: String?
    var additionalInfo: String?
    
    init(dictionary: [String : AnyObject]) {
        self.whichDay = dictionary["whichDay"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.listData = dictionary["listData"] as? [String]   ?? [""]
        self.importantNote = dictionary["importantNote"] as? String  ?? nil
        self.additionalInfo = dictionary["additionalInfo"] as? String  ?? nil
    }
}
