//
//  ContentView.swift
//  FlagGuessing
//
//  Created by Thy Nguyen on 8/27/21.
//  Latest edit: 8/28/21
//  Instructor: Paul Hudson
//

import SwiftUI

struct FlagImage: View {
    var text: String // country name
    
    var body: some View {
        Image(text)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 1)
    }
}

struct ContentView: View {
    // Variables for displaying flags
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled() // shuffle the countries array when the game starts
    @State private var correctAnswer = Int.random(in: 0...2) // pick random num from 0 to 2 (included)
    
    // Variables for showing scores
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    // Store users' score
    @State private var userScore = 0.0
    
    var body: some View {
        ZStack {
            // the bottom layer
            // Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            // or
            /*
             LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                 .edgesIgnoringSafeArea(.all)
             */
            VStack(spacing: 30) {
                // Text field
                VStack {
                    Text("Tap the flag of").foregroundColor(.white).font(.title)
                    Text(countries[correctAnswer]).foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                // Display flags
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        //Image(self.countries[number]).renderingMode(.original).clipShape(Capsule()).overlay(Capsule().stroke(Color.black, lineWidth: 1)).shadow(color: .black, radius: 1)
                        // Use FlagImage view instead of the above
                        FlagImage(text: self.countries[number])
                    }
                }
                
                
                VStack {
                    Text("Your Score: \(userScore, specifier: "%.2f")").font(.headline).foregroundColor(.white)
                }
                
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore, specifier: "%.2f")"), dismissButton: .default(Text("Continue")){
                self.reset()
            })
        } // add alert right after closing the ZStack
    }
    
    // Put these funs right after the body property
    // to show the alert
    func flagTapped(_ numTaps: Int) {
        if numTaps == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1.0
        } else {
            scoreTitle = "Incorrect. That is \(countries[numTaps]) flag"
            userScore -= 0.5
        }
        
        showingScore = true
    }
    // reset the game after showing the alert
    func reset() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
