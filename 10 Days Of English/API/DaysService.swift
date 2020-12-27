//
//  DayService.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation
import Firebase
struct DaysService {
    static let shared = DaysService()
    
    
    
    func fetchDays(completion: @escaping([Day]) -> Void) {
        var days = [Day]()
        REF_DAYS.observe(.childAdded) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let day = Day(dictionary: dictionary)
            days.append(day)
           
          
            if (days.count == 10 ) {
                 print("DEBUG: GET API RESPONSE")
                completion(days)
            }
        }
    }
}
