//
//  OnDragGesture.swift
//  Education_2
//
//  Created by Максим Радюш on 7.12.22.
//
// MARK: Education DragGesture

import SwiftUI

struct OnDragGesture: View {
    
    @State private var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State private var currentOffsetY: CGFloat = 0.0
    @State private var endingOffsetY: CGFloat = 0.0
    
    var body: some View {
//        TabView {
//            MenuSubView()
//            RectangleSubView()
//        }
//        .accentColor(.black)
        
        ZStack {
            
            Color.green.ignoresSafeArea()
            
            Spacer()
            
            VStack {
                Text("sOff \(startingOffsetY)")
                Text("cOff \(currentOffsetY)")
                Text("eOff \(endingOffsetY)")
            }
            .tag(100)
            .zIndex(1000)
            
            DragGestureMenuView()
                .offset(y: startingOffsetY)
                .offset(y: currentOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentOffsetY  = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if (currentOffsetY <= -150) {
                                    endingOffsetY = -startingOffsetY
                                    currentOffsetY = 0
                                } else if currentOffsetY >= 150 {
                                        endingOffsetY = 0
                                    currentOffsetY = 0
                                } else {
                                    currentOffsetY  = 0
                                }
                            }
                        })
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}


struct OnDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        OnDragGesture()
    }
}

struct MenuSubView: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            NavigationView {
                NavigationLink("Go To The", destination: DragGestureMenuView())
                    .foregroundColor(.blue)
                    .underline(true, pattern: .solid, color: .blue)
            }
        }
        .tabItem {
            Image(systemName: "circle.fill")
            Text("Menu")
        }
    }
}

struct DragGestureMenuView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app.")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .cornerRadius(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(ignoresSafeAreaEdges:  .horizontal)
        .cornerRadius(30)
    }
}

struct RectangleSubView: View {
    
    @State private var offset: CGSize = .zero
    @State private var offsetEnd: CGSize?
    
    var body: some View {
        VStack {
            Text("width \(offset.width)")
            Text("height \(offset.height)")
            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .foregroundColor(.black.opacity(Double(getScaleAmount())))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                    
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                )
            Spacer()
        }
        .tabItem {
            Image(systemName: "rectangle.fill")
            Text("Rectangle")
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle = Double(10)
        return percentageAsDouble * maxAngle
    }
}
