//
//  Examples.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI
import Charts

struct Examples: View {
    var body: some View {
        Text("Examples")
    }
}

struct KLineGestureOverlay: UIViewRepresentable {
    typealias UIViewType = UIView
    
    var onChanged: (Details) -> Void
    
    enum Details {
        case pinch(Pinch)
        case pinchEnd
        case drag(Drag)
        case dragEnd(CGPoint)
    }
    
    struct Pinch {
        var scale: CGFloat
        var location: CGPoint
    }
    
    struct Tap {
        var count: Int
    }
    
    struct Drag {
        var startLocation: CGPoint
        var currentLocation: CGPoint
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .red.withAlphaComponent(0.2)
        
        let pinch = UIPinchGestureRecognizer()
        pinch.addTarget(context.coordinator, action: #selector(Coordinator.pinchAction(_:)))
        view.addGestureRecognizer(pinch)
        
        let pan = UIPanGestureRecognizer()
        pan.addTarget(context.coordinator, action: #selector(Coordinator.panAction(_:)))
        view.addGestureRecognizer(pan)
        
        return view
    }
    
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var parent: KLineGestureOverlay
        
        init(parent: KLineGestureOverlay) {
            self.parent = parent
        }
        
        @objc func pinchAction(_ sender: UIPinchGestureRecognizer) {
            switch sender.state {
            case .began: fallthrough
            case .changed:
                parent.onChanged(
                    .pinch(.init(scale: sender.scale, location: sender.location(in: sender.view)))
                )
            case .cancelled: fallthrough
            case .ended:
                parent.onChanged(.pinchEnd)
            default:
                break
            }
        }
        
        private var dragStartLocation: CGPoint!
        
        @objc func panAction(_ sender: UIPanGestureRecognizer) {
            switch sender.state {
            case .began:
                dragStartLocation = sender.location(in: sender.view)
            case .changed:
                parent.onChanged(.drag(.init(startLocation: dragStartLocation, currentLocation: sender.location(in: sender.view))))
            case .cancelled: fallthrough
            case .ended:
                dragStartLocation = nil
                parent.onChanged(.dragEnd(sender.velocity(in: sender.view)))
            default:
                break
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    static func dismantleUIView(_ uiView: UIView, coordinator: Coordinator) {
    }
}

struct Tick: Identifiable {
    var volume: Double
    var date: Date
    
    var id: Date {
        date
    }
}

let assetData: [Tick] = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let start = dateFormatter.date(from: "2222-03-01")!
    
    return (0..<60).map { i in
        let curr = start.addingTimeInterval(24 * 60 * 60 * Double(i))
        let randomF = Double(arc4random()) / Double(UInt32.max)
        return Tick(volume: 100 * randomF * sin(Double(i)) + 150, date: curr)
    }
}()

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Examples()
        }
    }
}
