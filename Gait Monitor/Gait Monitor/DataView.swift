//
//  DataView.swift
//  Gait Monitor
//
//  Created by Harrison Szczapa on 2/25/20.
//  Copyright © 2020 Harrison Szczapa. All rights reserved.
//
import Foundation
import SwiftUI

struct DataView: View {
    
    var data: DailyData
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Step Counts")) {
                    HStack{
                        Text("Total Left Steps: \(self.data.totalStepsL)")
                        Spacer()
                        Text("Total Right Steps: \(self.data.totalStepsR)")
                    }
                    HStack {
                        Spacer()
                        Text("Total Steps: \(self.data.totalSteps)")
                        Spacer()
                    }
                }
                
                Section(header: Text("Step Quality")) {
                    HStack{
                        Text(String(format: "Percent of Correct Left Steps: %.2f%%", self.data.percentLeft))
                        Spacer()
                        Text(String(format: "Percent of Correct Right Steps: %.2f%%", self.data.percentRight))
                    }
                    HStack {
                        Spacer()
                        Text(String(format: "Average Percent: %.2f%%", self.data.avgPercent))
                        Spacer()
                    }
                }
            }
            .navigationBarTitle(Text(self.data.date.asString(style: .full)), displayMode: .inline)
        }
    }
}

struct DataVew_Previews: PreviewProvider {
    static var previews: some View {
        DataView(data: DailyData(80, 20, 90, 10))
    }
}


