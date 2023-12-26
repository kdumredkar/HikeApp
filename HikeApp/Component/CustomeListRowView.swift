//
//  CustomeListRowView.swift
//  HikeApp
//
//  Created by Khiraj Umredkar on 26/12/23.
//

import Foundation
import SwiftUI

struct CustomeListRowView : View {
    
    //MARK:- Properties
    @State var rowLable: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLable: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if (rowContent != nil) {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLable != nil && rowLinkDestination != nil) {
                
                Link(rowLinkLable!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            } else {
                EmptyView()
            }
           
        } label: {
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLable)
            }
        }

    }
}

#Preview {
    List(0 ..< 5) { item in
        CustomeListRowView(rowLable: "Website",
                           rowIcon: "globe",
                           rowContent: nil,
                           rowTintColor: .pink,
        rowLinkLable: "credo Acedemy",
        rowLinkDestination: "https://credo.academy")
    }
}
