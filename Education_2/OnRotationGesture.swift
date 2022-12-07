//
//  OnRotationGesture.swift
//  Education_2
//
//  Created by Максим Радюш on 7.12.22.
//
// MARK: Education RotationGesture

import SwiftUI

struct OnRotationGesture: View {
    
    @State private var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.green)
                .frame(width: 200, height: 200)
                .rotationEffect(angle)
                .gesture(
                    RotationGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                angle = value
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                angle = Angle(degrees: 0)
                            }
                        }
                )
        }
    }
}

struct OnRotationGesture_Previews: PreviewProvider {
    static var previews: some View {
        OnRotationGesture()
    }
}
