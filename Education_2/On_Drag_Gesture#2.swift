//
//  On_Drag_Gesture#2.swift
//  Education_2
//
//  Created by Максим Радюш on 12.12.22.
//

import SwiftUI

struct On_Drag_Gesture_2: View {
    
    @State private var startOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State private var currentOffsetY: CGFloat = 0.0
    @State private var endedOffsetY: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(edges: .all)
            
            VStack {
                Text("startOffsetY =  \(startOffsetY)")
                Text("currentOffsetY =  \(currentOffsetY)")
                Text("endedOffsetY =  \(endedOffsetY)")
            }
            .tint(.primary)
            .zIndex(2)
            
            SlideMenu()
                .offset(y: startOffsetY)
                .offset(y: currentOffsetY)
                .offset(y: endedOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentOffsetY = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentOffsetY <= -150 {
                                    currentOffsetY = 0
                                    endedOffsetY = -startOffsetY
                                } else if currentOffsetY >= 150 {
                                    currentOffsetY = 0
                                    endedOffsetY = 0
                                } else {
                                    currentOffsetY = 0
                                }
                            }
                        })
                )
        }
        .background(.green)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct SlideMenu: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<3) { _ in
                    MiniCircle()
                }
            }
            .padding(.top, 20)
            
            Text("Show more")
            Image(systemName: "cloud.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Anything text...")
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(ignoresSafeAreaEdges: .horizontal)
        .cornerRadius(30)
    }
}

struct MiniCircle: View {
    var body: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 10, height: 10)
    }
}

struct On_Drag_Gesture_2_Previews: PreviewProvider {
    static var previews: some View {
        On_Drag_Gesture_2()
    }
}
