//
//  OnMagnificationGesture.swift
//  Education_2
//
//  Created by Максим Радюш on 4.12.22.
//
//  MARK: Education Swift UI MagnificationGesture

import SwiftUI

struct OnMagnificationGesture: View {
    
    @State var currentAmount: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Circle()
                        .frame(height: 50)
                    Text("Swift UI thinking")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 300)
                    .scaleEffect(currentAmount + 1)
                    .gesture(
                        MagnificationGesture()
                            .onChanged( { value in
                                withAnimation(.spring()) {
                                    self.currentAmount = value - 1
                                }
                            })
                            .onEnded( { _ in
                                withAnimation(.spring()) {
                                    self.currentAmount = 0
                                }
                            })
                    )
                
                HStack {
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                }
                
                .padding(.horizontal)
                Text("This is caption for my photo!")
            }
        }
    }
}

struct OnMagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        OnMagnificationGesture()
    }
}
