//
//  Data.swift
//  Gait Monitor
//
//  Created by Harrison Szczapa on 2/7/20.
//  Copyright © 2020 Harrison Szczapa. All rights reserved.
//

import Foundation


// One way that we could store data. The 4 values passed to the init() funciton
// would need to come from the Arduino. Just an idea for now.
struct DailyData: Identifiable, Codable {
    let id = UUID()
    let date = Date()
    // Number of Steps in Each foot
    let totalStepsL: Int
    let totalStepsR: Int
    
    // Total number of steps
    let totalSteps: Int
    
    // Total number of 'good' steps from each foot
    let goodStepsL: Int
    let goodStepsR: Int
    
    // Total number of 'Bad' steps from each foot
    let badStepsL: Int
    let badStepsR: Int
    
    // Percentage of 'good' steps from each foot
    let percentLeft: Double
    let percentRight: Double
    
    // Total Percentage
    let avgPercent: Double
    
    init(_ goodL:Int,_ badL:Int,_ goodR:Int,_ badR:Int) {
        // Set the 'good' values
        self.goodStepsL = goodL
        self.goodStepsR = goodR
        // Set the 'bad' values
        self.badStepsL = badL
        self.badStepsR = badR
        // Calculate the total
        self.totalStepsL = goodL + badL
        self.totalStepsR = goodR + badR
        //Calculate the total number of steps
        self.totalSteps = self.totalStepsL + self.totalStepsR
        
        // Calculate the percent of good steps
        self.percentLeft = (Double(goodStepsL) / Double(totalStepsL)) * 100
        self.percentRight = (Double(self.goodStepsR) / Double(self.totalStepsR)) * 100
        // Calculate the Overall Percentage
        self.avgPercent = (self.percentLeft + self.percentRight) / 2.00
    }
    
}

class AllData: ObservableObject {
    @Published var dataArray: [DailyData] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(dataArray) {
                UserDefaults.standard.set(encoded, forKey: "DataArray")
            }
        }
    }
    
    init() {
        if let dataArray = UserDefaults.standard.data(forKey: "DataArray") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([DailyData].self, from: dataArray) {
                self.dataArray = decoded
                return
            }
        }
        dataArray = []
    }
}

extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

