//
//  OnLongPressGesture.swift
//  Education_2
//
//  Created by Максим Радюш on 29.11.22.
//

import SwiftUI

struct OnLongPressGesture: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(height: 55)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("Click")
                    .padding()
                    .padding(.horizontal)
                    .background(.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isComplete = true
                        }
                    }
                
                Text("Reset")
                    .padding()
                    .padding(.horizontal)
                    .background(.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isComplete = false
                            isSuccess = false
                        }
                    }
            }
            
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50.0) {
                withAnimation(.spring()) {
                    isSuccess = true
                }
                } onPressingChanged: { (isPressing) in
                    if isPressing {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isComplete = true
                        }
                    }
                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if !isSuccess {
                                withAnimation(.easeInOut) {
                                    isComplete = false
                                }
                            }
                        }
                    }
                }

        }
    }
}

struct OnLongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        OnLongPressGesture()
    }
}
