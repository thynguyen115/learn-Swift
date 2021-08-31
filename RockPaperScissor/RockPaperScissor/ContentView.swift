//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Thy Nguyen on 8/28/21.
//  Last edit: 08/30/2021
//  Problem requirement: https://www.hackingwithswift.com/guide/ios-swiftui/2/3/challenge
//

import SwiftUI

struct DisplayImage: View {
    var choice: String
    var body: some View {
        Image(choice)
            .renderingMode(.original).clipShape(RoundedRectangle(cornerRadius: 30.0)).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView: View {
    // Necessary vars
    @State  private var possibleChoices = ["Rock", "Paper", "Scissors"]
    @State private var playerScore = 0.0
    @State private var cmpScore = 0.0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    // Current app/player's choices
    @State private var appChoice = Int.random(in: 0...2)
    // @State private var playerWins = "Win"
    
    
    
    var body: some View {
        VStack {
            Text("Your score: \(playerScore, specifier: "%.2f")")
            Text("Computer score: \(cmpScore, specifier: "%.2f")").font(.subheadline)
            ForEach(0 ..< 3) { idx in
                Button(action: {
                    self.picked(idx)
                }) {
                    DisplayImage(choice: self.possibleChoices[idx])
                    Text(self.possibleChoices[idx])
                }
            }
            Spacer()
            Spacer()
            Spacer()
           
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Computer picked \(possibleChoices[appChoice])"),  dismissButton: .default(Text("Continue")){
                self.reset()
            })
        }
    }
    
    // funcs for button to work
    func picked(_ choice: Int) {
        if choice == appChoice {
            scoreTitle = "A Tie!"
        } else if (appChoice == 0 && choice == 2) || (choice + 1 == appChoice) {
                playerScore -= 0.5
                cmpScore += 2
                scoreTitle = "Defeat!"
        } else {
                playerScore += 1.0
                cmpScore -= 0.5
                scoreTitle = "Win!"
            }
        showingScore = true
    }
    
    func reset() {
        appChoice = Int.random(in: 0...2)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
