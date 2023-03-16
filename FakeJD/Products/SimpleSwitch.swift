//
//  SimpleSwitch.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/17.
//

import SwiftUI

struct SimpleSwitch: UIViewRepresentable {
    @Binding var isOn: Bool
    
    class Coordinator: NSObject {
        var switcher: SimpleSwitch
        
        init(_ switcher: SimpleSwitch) {
            self.switcher = switcher
        }
        
        @objc func action(sender: UISwitch) {
            switcher.isOn = sender.isOn
        }
    }
    
    func makeUIView(context: Context) -> UISwitch {
        let switcher = UISwitch()
        switcher.addTarget(
            context.coordinator,
            action: #selector(Coordinator.action(sender:)), for: .valueChanged
        )
        return switcher
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.setOn(isOn, animated: true)
    }
    
    static func dismantleUIView(_ uiView: UISwitch, coordinator: Coordinator) {
        print("dismantle \(uiView)")
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

struct SimpleSwitch_Previews: PreviewProvider {
    @State static var isOn = false
    
    static var previews: some View {
        return SimpleSwitch(isOn: $isOn)
    }
}
