//
//  ContentView.swift
//  Gait Monitor
//
//  Created by Harrison Szczapa on 2/6/20.
//  Copyright © 2020 Harrison Szczapa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var allData = AllData()
    
    
    let test = DailyData(80, 20, 90, 10)
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Connect") {
                    // Call the CB Delegate
                }
                Spacer()
                Text("Here is where the data from the current day will go")

                Spacer()
                Spacer()
                Text("Add a list here with all the old data")
                Spacer()
            }
            .navigationBarTitle(Text("Gait Monitor"))
            .navigationBarItems(trailing: Button("Refresh") {
                //Get the data from the shoe
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
