//
//  ContentView.swift
//  SliderGameApp
//
//  Created by Aleksandr Kretov on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 50
    @State private var alertPresented = false
    @State private var targetNumber = Int.random(in: 0...100)
    @State private var color = UIColor.red.withAlphaComponent(1.0)
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 32) {
                Text("Подвиньте слайдер как можно ближе к: \(targetNumber)")
                    .lineLimit(2)
                UISliderView(value: $sliderValue, targetNumber: $targetNumber, color: .red.withAlphaComponent(sliderValue / Double(targetNumber)))
                Button(action: showAlert) {
                    Text("Проверить результат")
                }
                Button("Начать заново") {newGame()}
            }
            Spacer()
        }
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
