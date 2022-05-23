//
//  ContentView.swift
//  SliderGameApp
//
//  Created by Aleksandr Kretov on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Double = 50
    @State private var targetNumber = Int.random(in: 0...100)
    @State private var alertPresented = false

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 32) {
                Text("Подвиньте слайдер как можно ближе к числу \(targetNumber)")
                    .multilineTextAlignment(.center)
                HStack {
                    Text("0")
                    SliderView(value: $sliderValue, targetNumber: targetNumber)
                    Text("100")
                }
                Button(action: showAlert) {
                    Text("Проверить результат").bold().foregroundColor(.green)
                }
                Button(action: newGame) {
                    Text("Начать заново").bold()
                }
            }
            Spacer()
        }
        .padding()
        .alert("Результат", isPresented: $alertPresented, actions: {}) {
            Text("Вы набрали \(computeScore()) очков")
        }
    }

    private func showAlert() {
        alertPresented.toggle()
    }

    private func newGame() {
        sliderValue = Double.random(in: 0...100)
        targetNumber = Int.random(in: 0...100)
    }

    private func computeScore() -> Int {
        let difference = abs(targetNumber - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
