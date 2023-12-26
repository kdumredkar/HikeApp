//
//  CardView.swift
//  HikeApp
//
//  Created by Khiraj Umredkar on 26/12/23.
//

import Foundation
import SwiftUI
struct CardView: View {
    // MARK: - Proprties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - Function
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
      
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        Button {
                            isShowingSheet = true
                            print("The button was pressed")
                        }label: {
                            CustomButtonView()
                        }.sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    Text("Fun and enjoyable outdoor activity for friend and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }.padding(.horizontal, 30)
                //MARK: - HEADER
                
                //MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(randomNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                //MARK: - FOOTER
                Button{
                    randomImage()
                   print("Button pressed")
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }.buttonStyle(GradentButton())
                
            }
            //MARK: - FOOTER
        }.frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
