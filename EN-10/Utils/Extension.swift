//
//  Extension.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UIColor
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let mainBlue = UIColor.rgb(red: 100, green: 190, blue: 245)

    static let mainPink = UIColor.rgb(red: 248, green: 159, blue: 174)

    static let lightBlue = UIColor.rgb(red: 217, green: 245, blue: 245)
}

