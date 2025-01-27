//
//  CustomButtonView.swift
//  HikeApp
//
//  Created by Khiraj Umredkar on 26/12/23.
//

import Foundation
import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.white,
                                              .customGreenLight,
                                              .customGreenMedium],
                                     startPoint: .top,
                                     endPoint: .bottom)
                )
            
            Circle()
                .stroke(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom), lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(colors: [.colorGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
               
        }// ZStack
        .frame(width: 58, height: 58)
        
    }
}

#Preview {
    CustomButtonView()
        .padding()
}

