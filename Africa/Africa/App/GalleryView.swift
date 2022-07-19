//
//  GalleryView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/18/22.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    //Simple Grid
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
     
    //Efficient Grid Definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic Grid Layout

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 30){
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: {value in
                        withAnimation(.easeIn){
                            gridSwitch()
                        }
                    })
                
                //MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals){ item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }
                }//: Grid
                .onAppear(){
                    gridSwitch()
                }
            }//: Vstack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
