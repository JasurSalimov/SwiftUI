//
//  MapView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/18/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
        // Mark: Basic Map
//        Map(coordinateRegion: $region)
//            .ignoresSafeArea()
        
        //MARK: - Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // Option A: Old style (always static)
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            //Option B: New style (always static)
//            MapMarker(coordinate: item.location,tint: .accentColor)
            
            // Option C: Custom Basic Annotation
//            MapAnnotation(coordinate: item.location, content: {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 42, height: 42, alignment: .center)
//            })//: Annotation
            MapAnnotation(coordinate: item.location, content: {
                MapAnnotationView(location: item)
            })
        })
        .overlay(
            HStack{
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                }
            }//: Hstack
            .padding(.vertical, 12 )
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            .padding(.top, 20)
            ,alignment: .top
        )//: overlay
        .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
