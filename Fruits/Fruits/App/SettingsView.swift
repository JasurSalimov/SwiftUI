//
//  SettingsView.swift
//  Fruits
//
//  Created by Jasur Salimov on 7/15/22.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("onboarding") var isOnboarding: Bool = false
    
    @State private var toggleValue: Bool = false
    //MARK: - Body
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:20) {
                    //MARK: - Secion 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle"),
                        content: {
                            
                            Divider().padding(.vertical, 4)
                            HStack(alignment: .center, spacing: 4){
                             Image("logo")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9)
                                Spacer()
                                Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                    .font(.footnote)
                            }
                    })
                    //MARK: - Section 2
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"),
                        content: {
                            Divider().padding(.vertical, 4)
                            VStack(spacing:8){
                                Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                    .padding(.vertical, 8)
                                    .frame(minHeight: 60)
                                    .layoutPriority(1)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Toggle(isOn: $isOnboarding){
                                    if isOnboarding{
                                        Text("Restarted".uppercased())
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.green)
                                    }else{
                                        Text("Restart".uppercased())
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.secondary)
                                    }
                                }
                                .padding()
                                .background(Color(UIColor.tertiarySystemBackground)
                                    .clipShape(
                                        RoundedRectangle(
                                        cornerRadius: 8,
                                        style: .continuous )
                                    )
                                            )
                            }
                    })
                    //MARK: - Section 3
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Customization", labelImage: "info.circle"),
                        content: {
                            Divider().padding(.vertical, 4)
                            SettingsRowView(name: "Developer", content: "Jasur Salimov")
                            SettingsRowView(name: "Designer", content: "Timur Nigmatov")
                            SettingsRowView(name: "Compatibility", content: "iOS 16")
                            SettingsRowView(name: "Website", linkLabel: "OU7", linkDestination: "ou7.uz")
                            SettingsRowView(name: "Website", linkLabel: "7Saber", linkDestination: "7saber.uz")
                            SettingsRowView(name:"SwiftUi", content: "4.0")
                            SettingsRowView(name: "Version", content: "1.0")
                    })
                }//: VStack
                .navigationTitle(Text("Settings"))
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems( trailing:
                                        Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            }//:Scroll
        }//:Navigation
    }
}

//MARK: - Previews
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
