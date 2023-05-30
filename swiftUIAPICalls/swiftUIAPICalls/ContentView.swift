//
//  ContentView.swift
//  swiftUIAPICalls
//
//  Created by Nojood Aljuaid  on 09/11/1444 AH.
//

import SwiftUI
struct ContentView: View {
   
    var body: some View {
        TabView {
            BrowserView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                        Text("Quotes")
                }
            secondView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("videos")
                }
            thirdView()
            fourthView()
        }
           }
       }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
