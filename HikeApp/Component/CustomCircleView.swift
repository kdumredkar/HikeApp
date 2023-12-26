//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Khiraj Umredkar on 26/12/23.
//

import Foundation
import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradenr: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
           LinearGradient(colors: [
            .customIndigoMedium,
            .customSalmonLight
           ],
                          startPoint: isAnimateGradenr ? .topLeading : .bottomLeading,
                          endPoint: isAnimateGradenr ? .bottomTrailing : .topLeading) )
           .onAppear {
               withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                   isAnimateGradenr.toggle()
               }
           }
      MotionAnimationView()
        } .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
