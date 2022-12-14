//
//  ContentView.swift
//  Education_2
//
//  Created by Максим Радюш on 29.11.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Education!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnLongPressGesture()
    }
}
