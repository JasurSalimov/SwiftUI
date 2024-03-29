//
//  ListRowItemView.swift
//  Devote
//
//  Created by Jasur Salimov on 8/10/22.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    var body: some View {
        HStack{
            Toggle(isOn: $item.completion, label: {
                Text(item.task ?? "")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(item.completion ? Color.pink : Color.primary)
                    .padding(.vertical, 12)
                    .animation(.default)
            })// Toggle
            .toggleStyle(CheckBoxStyle())
            .onReceive(item.objectWillChange, perform: { _ in
                if self.viewContext.hasChanges{
                    try? self.viewContext.save()
                }
            })
        }
        
    }
}
