//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Thy Nguyen on 8/27/21.
//  Instructor: Paul Hudson
//

import SwiftUI

struct CustomView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}
extension View {
    func titleStyle() -> some View {
        self.modifier(CustomView())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!").titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
