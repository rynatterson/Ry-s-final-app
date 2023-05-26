//////
//////  ContentView.swift
//////  Ry Cool APp Computer science
//////
//////  Created by Ry Natterson on 5/8/23.


import SwiftUI

struct ContentView: View {
    @State var artData: Art?
    @State var guess: String = ""
    @State var feedback: String = ""
    @State var isCorrectGuess = false
    @State var guessCount = 0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if let art = artData {
                    Text("Guesses: \(guessCount)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                        .padding(.top)
                    
                    AsyncImage(url: URL(string: art.primaryImageSmall)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 300, height: 300)
                    .cornerRadius(8)
                    
                    Text(feedback)
                        .font(.title2)
                        .bold()
                        .foregroundColor(isCorrectGuess ? .green : .red)
                        .padding(.top)
                    
                    Divider()
                    
                    Text(art.title)
                    
                    Divider()
                    
                    HStack {
                        Text("Department: " + art.department)
                    }
                    
                    Divider()
                    
                    TextField("Enter a year", text: $guess)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal)
                    
                    if isCorrectGuess {
                        Button("Reset Art") {
                            resetArt()
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.blue)
                        )
                        .padding(.top)
                    } else {
                        Button(action: {
                            guessCount += 1
                            checkGuess()
                        }) {
                            Text("Guess")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.blue, .purple]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(8)
                                .padding(.top)
                        }
                    }
                } else {
                    Text("Loading...")
                        .foregroundColor(.pink)
                        .font(.title)
                        .padding()
                }
            }
            .padding()
            .onAppear {
                loadRandomArtwork()
            }
        }
    }
    
    func loadRandomArtwork() {
        let randomID = Int.random(in: 1...500000)
        let apiURL = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(randomID)")!
        let request = URLRequest(url: apiURL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let data = data {
                    let art = try JSONDecoder().decode(Art.self, from: data)
                    self.artData = art
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func checkGuess() {
        guard let art = artData else { return }
        guard let guessInt = Int(guess) else {
            feedback = "Please enter a valid year"
            return
        }
        
        let yearDifference = abs(guessInt - art.objectEndDate)
        
        if yearDifference > 200 {
            if guessInt > art.objectEndDate {
                feedback = "Try lower than \(guessInt) ↓"
            } else {
                feedback = "Try higher than \(guessInt) ↑"
            }
        } else if yearDifference > 50 {
            if guessInt > art.objectEndDate {
                feedback = "Try a little lower than \(guessInt) ↓"
            } else {
                feedback = "Try a little higher than \(guessInt) ↑"
            }
        } else {
            if guessInt == art.objectEndDate {
                feedback = "Correct!"
                isCorrectGuess = true
            } else if guessInt > art.objectEndDate {
                feedback = "Close, but try a little lower than \(guessInt) ↓"
            } else {
                feedback = "Close, but try a little higher than \(guessInt) ↑"
            }
        }
    }





    
    func resetArt() {
        artData = nil
        guess = ""
        feedback = ""
        isCorrectGuess = false
        guessCount = 0
        loadRandomArtwork()
    }
}
