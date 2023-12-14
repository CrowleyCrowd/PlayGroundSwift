//
//  ContentView.swift
//  SecondPracticeSwiftUI
//
//  Created by Usuario invitado on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionNote = ""
    @StateObject var noteViewModel = NotesViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack {
                Text("Añadir una tarea").underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16.0)
                    .bold()
                TextEditor(text: $descriptionNote)
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(.green, lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .cornerRadius(3)
                Button ("Crear") {
                    noteViewModel.saveNote(description: descriptionNote)
                    
                    descriptionNote = ""
                }
                .buttonStyle(.bordered)
                .tint(.green)
                Spacer()
                List {
                    ForEach(noteViewModel.notes, id: \.id) {
                        nota in HStack {
                            if nota.isFavorited {
                                Text("🤩")
                            }
                            Text(nota.description)
                        }
                    }
                }
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.large)
        }
        
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
