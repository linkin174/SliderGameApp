//
//  UISliderView.swift
//  SliderGameApp
//
//  Created by Aleksandr Kretov on 23.05.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    var difference: Int

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        let thumbOpacity = Double(difference) / 100
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(thumbOpacity)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, difference: difference)
    }
}

extension SliderView {
    
    final class Coordinator: NSObject {
        @Binding var value: Double
        var difference: Int

        init(value: Binding<Double>, difference: Int) {
            self._value = value
            self.difference = difference
        }

        @objc func sliderValueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UISliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(35), difference: 100
        )
    }
}
