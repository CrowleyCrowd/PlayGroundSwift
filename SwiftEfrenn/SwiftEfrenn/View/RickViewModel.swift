//
//  FarmanetViewModel.swift
//  SwiftEfrenn
//
//  Created by Usuario invitado on 20/12/23.
//

import Foundation

class RickViewModel : ObservableObject {
    
    @Published var characters : [Result] = []
    
    func getCharacters () {
        let url = URL (string : "https://rickandmortyapi.com/api/character")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print ("Error \(error)")
            }
            
            if let data  = data,
               let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let rickDataModel = try! JSONDecoder().decode(RickModel.self, from: data)
                print("Characters \(rickDataModel)")
                
                DispatchQueue.main.async {
                    self.characters = rickDataModel.results
                }
            }
        }.resume()
    }
}
