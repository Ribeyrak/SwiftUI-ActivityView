//
//  ContentView.swift
//  SwiftUI-ActivityView
//
//  Created by Evhen Lukhtan on 22.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSharePresented = false
    let customActivity = ActivityViewCustomActivity(activityName: "SomeApp",
                                                    activityImageName: "tel4") {
        print("Done")
    }
    
    var body: some View {
        VStack {
            
            Button("Prees") {
                isSharePresented = true
            }
            .sheet(isPresented: $isSharePresented) {
                ActivityView(activityItems: ["Message Test"], applicationActivites: [customActivity])
            }
            
            
        }

    }
}

#Preview {
    ContentView()
}
