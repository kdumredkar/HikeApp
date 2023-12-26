//
//  SettingsView.swift
//  HikeApp
//
//  Created by Khiraj Umredkar on 26/12/23.
//

import Foundation
import SwiftUI
struct SettingsView :View {
    //MARK: - Properties
    
    private let alternateAppIcon: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Mushroom",
    "AppIcon-Map",
    "AppIcon-Campfire"]
    var body: some View {
        List{
            // MARK: - SECTION HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editer Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }.foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,
                                            .customGreenMedium,
                                            .customGreenDark],
                                   startPoint: .top,
                                   endPoint: .bottom))
                .padding(.top, 8)
               
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but even better once you are actually there. The hike that you hope to do again someday. \n find the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                    
                    
                }.multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
                
            }.listRowSeparator(.hidden)
            // MARK: - SECTION : ICON
            Section(header: Text("Alternate Icon")) {
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcon.indices, id: \.self) {
                            item in
                            Button(action: {
                                UIApplication.shared.setAlternateIconName(alternateAppIcon[item]) { error in
                                    
                                    if error != nil {
                                        print("Icon change failed: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success")
                                    }
                                    
                                }
                            }, label: {
                                Image("\(alternateAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            })
                            
                        }
                    }
                    
                }.padding(.top, 12)
                
                
                Text("Choose your favourites app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }.listRowSeparator(.hidden)
            
            // MARK: - SECTION ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright @ All right reserved")
                    Spacer()
                }) {
                    // 1. Basic labelled content
//                    LabeledContent("Application", value: "Hike")
                    // 2. Advance labelled content
                    
                    CustomeListRowView(rowLable: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                    
                    CustomeListRowView(rowLable: "Comapatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                    
                    CustomeListRowView(rowLable: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                    
                    CustomeListRowView(rowLable: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    
                    CustomeListRowView(rowLable: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Khiraj", rowTintColor: .mint)
                    
                    CustomeListRowView(rowLable: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                    
                    CustomeListRowView(rowLable: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLable: "Credo Acedemy", rowLinkDestination: "https://credo.academy" )
                    
                }
            
           
        }
    }
}
#Preview {
    SettingsView()
}
