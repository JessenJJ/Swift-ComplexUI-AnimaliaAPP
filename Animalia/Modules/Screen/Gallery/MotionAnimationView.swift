//
//  MotionAnimationView.swift
//  Animalia
//
//  Created by User50 on 30/04/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    // 1. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...600))
    }
    // 2. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1 ... 2.0))
    }
    // 3. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in:0.25...1.0)
    }
    // 4. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    // 5. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach (0...randomCircle, id:\.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.12)
                        .frame(width: randomSize(),height: randomSize(),alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1 )
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay()),
                                   value: isAnimating)
                        .onAppear{
                            isAnimating = true
                        }
                    
                }
            }
            .drawingGroup()
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    MotionAnimationView()
}
