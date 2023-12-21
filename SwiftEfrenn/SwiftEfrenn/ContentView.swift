//
//  ContentView.swift
//  SwiftEfrenn
//
//  Created by Usuario invitado on 20/12/23.
//

import SwiftUI
import Figlet

struct ContentView: View {
    
    @StateObject var viewModel = RickViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    ForEach(viewModel.characters, id: \.name) {
                        character in Text (character.name)
                    }
                }
            }
            .padding()
        }.onAppear {
            Figlet.say("Efrenn Alba")
            viewModel.getCharacters()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
