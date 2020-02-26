//
//  ContentView.swift
//  Gait Monitor
//
//  Created by Harrison Szczapa on 2/6/20.
//  Copyright © 2020 Harrison Szczapa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var bluetooth = Bluetooth()
    
    @ObservedObject var allData = AllData()
    
    @State private var scan = false
    
    var test = DailyData(80, 20, 90, 10)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here is where the data from the current day will go")
                .padding(150)
                
                //Spacer()
                //Spacer()
              
                VStack {
                    Form {
                        Section(header: Text("Daily Waking Data").bold()) {
                            List {
                                ForEach(allData.dataArray) { data in
                                    
                                    NavigationLink(destination: DataView(data: data)) {
                                        HStack {
                                            Text(data.date.asString(style: .full))
                                            Spacer()
                                            Text(String(format: "%.2f%%", data.avgPercent))
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            
                
            }
            .navigationBarTitle(Text("Gait Monitor"))
        .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: Button("Refresh") {
                self.allData.dataArray.append(self.test)
            })
            
        }
        //        .sheet(isPresented: $scan) {
        //            DataView(data: self.test)
        //        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Here is a new view!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
