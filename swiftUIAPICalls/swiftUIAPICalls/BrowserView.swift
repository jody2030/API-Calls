//
//  BrowserView.swift
//  swiftUIAPICalls
//
//  Created by Nojood Aljuaid  on 09/11/1444 AH.
//

import SwiftUI
import Foundation
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var author: String
    var text: String
}
struct BrowserView: View  {
    @State private var results = [Result]()
    var body: some View {

        List(results, id: \.author) { item in 
                   VStack(alignment: .leading) {
                       Text(item.text)
                       Text(item.author)
                   }
               }
               .task{
                   await loadData()
                       
               }
           }
           
    func loadData() async{
guard let url = URL(string: "https://type.fit/api/quotes") else {
                   print("Invalid URL")
                   return
               }
               
               do {
                   let (data, _) = try await URLSession.shared.data(from: url)
                   
                   if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                       results = decodedResponse.results
                       print(results)
                   }
               } catch {
                   print("Invalid data")
                   }
               }
           }

        
        
struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
