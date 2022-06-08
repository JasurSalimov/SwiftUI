//
//  SwiftUIView.swift
//  WatchApp WatchKit Extension
//
//  Created by Jasur Salimov on 6/7/22.
//

// There are several problems with frames in smaller apple watches
// 1 - for the three main texts no need for .leading padding
// 2 - for the player we need smaller spacer

// Watch devices that are supported right now  - series7 (45 mm), series 6 (44mm)
// all the others are not supported


import SwiftUI

class VideoController: WKHostingController<SwiftUIView>{
    override var body: SwiftUIView{
        SwiftUIView(progressWidth: 0, isPaused: false, totalSetTime: 20, progressInSeconds: 0)
    }
}

struct SwiftUIView: View {
    @State var progressWidth: CGFloat
    var screenHeight: CGFloat{
        return WKInterfaceDevice.current().screenBounds.height
    }
    var screenWidth: CGFloat{
        return WKInterfaceDevice.current().screenBounds.width
    }
    
// This was the best solution for me at the time to solve the constraint related stuff
    var customPg: CGFloat{
        let width = WKInterfaceDevice.current().screenBounds.width
        switch(width){
        case 396.0: // series 7 44 mm
            return 8
        case 352.0: // series 7 41 mm // passed
            return 0
        case 368.0: // series 5,6 44mm
            return 0
        default: // series 5,6 40mm and others
            return 4
        }
    }
    
    @State var isPaused: Bool
    var totalSetTime: Int
    @State var progressInSeconds: CGFloat
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        BackgroundProgress(width: progressWidth, height: screenHeight)
            .frame(width: screenWidth)
            .overlay{
                TimelineView(.periodic(from: .now, by: 1)) { context in
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("OU7")
                            .font(.system(size: 17, weight: .medium, design: .default))
                            .padding(.leading, 15 + customPg)
                        Text(":\(totalSetTime - Int(progressInSeconds))")
                                .font(.system(size: 44, weight: .bold, design: .default))
                                .padding(.leading,7 + customPg)
                        Text("The name of the TrainingThe name of the Training")
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .lineLimit(nil)
                            .padding(.leading, 7 + customPg)
                            .font(.system(size: 12, weight: .bold, design: .default))
                        ControlView(isPaused: isPaused)
                        Spacer()
                        BottomView(calories: 254, heartRate: 180)
                    })
                    .padding(EdgeInsets(top: 12, leading:32, bottom: 12, trailing: 32))
                }
            }
        .navigationBarHidden(true)
        .onReceive(timer, perform: {_ in
            invalidateProgress()
        })
    }
    
    func invalidateProgress(){
        let percent:CGFloat = screenWidth/CGFloat(totalSetTime)
        progressInSeconds += 0.25
        progressWidth = CGFloat(progressInSeconds)*percent
        if(Int(progressInSeconds) == totalSetTime){
            debugPrint("Timer stops")
            timer.upstream.connect().cancel()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(progressWidth: 0, isPaused: false, totalSetTime: 20, progressInSeconds: 0)
    }
}

struct BackgroundProgress: View{
    var width:CGFloat
    var height: CGFloat
    var body: some View{
        ZStack{
            withAnimation{
                Image("progressView")
                    .resizable()
                    .frame(width: width, height: height, alignment: .leading)
            }
        }
        .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height, alignment: .leading)
    }
}



struct ControlView: View {
    var screenWidth: CGFloat{
        return WKInterfaceDevice.current().screenBounds.width
    }
    var customPg: CGFloat{
        let width = WKInterfaceDevice.current().screenBounds.width
        switch(width){
        case 396.0: // series 7 44 mm
            return 8
        case 352.0: // series 7 41 mm // passed
            return 0
        case 368.0: // series 5,6 44mm
            return 0
        default: // series 5,6 40mm and others
            return 0
        }
    }
    var isPaused: Bool
    var actionIcon: String{
        if isPaused{
            return "playIcon"
        }else{
            return "pauseIcon"
        }
    }
    var body: some View {
        HStack{
            Spacer()
            Image("previousIcon")
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34)
                .onTapGesture(perform: {
                   previousPressed()
                })
            Spacer(minLength: 11 + customPg)
            Image("pauseIcon")
                .resizable()
                .frame(width: 58)
                .clipped()
                .aspectRatio(contentMode: .fit)
                .onTapGesture(perform: {
                     actionPressed()
                })
            Spacer(minLength: 11 + customPg)
            Image("nexticon")
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34)
                .onTapGesture(perform: {
                    nextPressed()
                })
            Spacer()
        }
        .frame(width: screenWidth, height: 58)
        .padding(.top, 12)
        .padding(.leading, 5)
        .padding(.trailing, 5)
    }
    
    private func previousPressed(){
        
    }
    private func actionPressed(){
        
    }
    private func nextPressed(){
        
    }
}

struct BottomView: View {
    var calories: Int
    var heartRate: Int
    var customPg: CGFloat{
        let width = WKInterfaceDevice.current().screenBounds.width
        switch(width){
        case 396.0: // series 7 44 mm
            return 8
        case 352.0: // series 7 41 mm
            return 0
        case 368.0: // series 5,6 44mm
            return 0
        default: // series 5,6 40mm and others
            return 0
        }
    }
    var screenWidth: CGFloat{
        return WKInterfaceDevice.current().screenBounds.size.width
    }
    
    var body: some View {
        HStack{
            HStack{
                Text(String(heartRate))
                    .font(.system(size: 20, weight: .medium, design: .default))
                Image("heartBeatIcon")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
            .frame(width: screenWidth/2 - 27)
            Spacer(minLength: 27)
            HStack{
                Text(String(calories))
                    .font(.system(size: 20, weight: .medium, design: .default))
                Image("calorieBurnIco")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
            .frame(width: screenWidth/2 - (19 + customPg), height: nil, alignment: .trailing)
        }
        .padding(.leading, 12)
        .padding(.trailing, 12)
    }
}

