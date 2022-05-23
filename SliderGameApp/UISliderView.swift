//
//  UISliderView.swift
//  SliderGameApp
//
//  Created by Aleksandr Kretov on 23.05.2022.
//

import SwiftUI

struct UISliderView: UIViewRepresentable {

    @Binding var value: Double
    @Binding var targetNumber: Int
    var color: UIColor
    
    private let bounds = UIScreen.main.bounds
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = color
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.minimumTrackTintColor = .blue
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, targetNumber: $targetNumber)
    }
}

extension UISliderView {
    final class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var targetNumber: Int
     
        init(value: Binding<Double>, targetNumber: Binding<Int>) {
            self._value = value
            self._targetNumber = targetNumber
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}


struct UISliderView_Previews: PreviewProvider {
    static var previews: some View {
        UISliderView(value: .constant(10), targetNumber: .constant(100), color: .red)
    }
}
