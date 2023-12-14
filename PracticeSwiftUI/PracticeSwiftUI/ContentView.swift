//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by Usuario invitado on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var textInput : String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .foregroundColor(.blue)
                .backgroundStyle(.green)
            TextField("", text: $textInput)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
