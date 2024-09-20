//
//  SwipeActionIndicatiorView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 11/09/24.
//

import SwiftUI

struct SwipeActionIndicatiorView: View {
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack {
            Text("Like")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset / SizeConstats.screenCutOff))
            
            Spacer()
            
            Text("Nope")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset / SizeConstats.screenCutOff) * -1)
        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicatiorView(xOffset: .constant(20))
}
