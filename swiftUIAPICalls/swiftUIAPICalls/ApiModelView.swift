//
//  ApiModelView.swift
//  swiftUIAPICalls
//
//  Created by Nojood Aljuaid  on 09/11/1444 AH.
//

import Foundation
import SwiftUI


struct Courses : Hashable , Codable {
    let name :String
    let image : String
}


class ViewModel : ObservableObject {
    @Published var courses : [Courses] = []
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak
        self] data ,  _ , error in
            
            guard let data = data , error == nil else {
                return
        }
            
            do {
                let courses = try JSONDecoder().decode([Courses].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }
            
        }
        task.resume()
    }
}









