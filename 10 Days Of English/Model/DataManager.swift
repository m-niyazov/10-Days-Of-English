//
//  DataManager.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation

final class DataManager {
    static let instance = DataManager()
    private init () {
        daysListUpdate()
    }
    
    var daysList: [Day] = []
    
    
    func daysListUpdate(){
        let day1 = Day(whichDay: 1, title: "СМОТРИМ СЕРИЮ “ДРУЗЕЙ")
        let day2 = Day(whichDay: 2, title: "ВЫУЧИТЬ НЕПРАВИЛЬНЫЕ ГЛАГОЛЫ")
        let day3 = Day(whichDay: 3, title: "РАЗБЕРИ СВОЮ ЛЮБИМУЮ ПЕСНЮ")
        let day4 = Day(whichDay: 4, title: "УЧИМ ФРАЗОВЫЕ ГЛАГОЛЫ")
        let day5 = Day(whichDay: 5, title: "ПОСМОТРИ ВИДЕО TED")
        let day6 = Day(whichDay: 6, title: "PREPOSITIONS + GERUND")
        let day7 = Day(whichDay: 7, title: "ТЕСТЫ")
        let day8 = Day(whichDay: 8, title: "ПОДКАСТЫ")
        let day9 = Day(whichDay: 9, title: "SPEAKING")
        let day10 = Day(whichDay: 10, title: "ЗАКРЕПИМ ПОЛУЧЕННЫЕ ЗНАНИЯ!")
        
        daysList = [day1, day2, day3, day4, day5, day6, day7, day8, day9, day10]
        
    }
    
}
