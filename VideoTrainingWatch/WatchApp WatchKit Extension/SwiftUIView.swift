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
    

    @State var isPaused: Bool
    var totalSetTime: Int
    @State var progressInSeconds: CGFloat
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        BackgroundProgress(width: progressWidth, height: screenHeight)
            .frame(width: screenWidth)
            .overlay{
                TimelineView(.periodic(from: .now, by: 1)) { context in
                    VStack(alignment: .center, spacing: 0, content: {
                        TextView(totalSetTime: totalSetTime, progressInSeconds: progressInSeconds)
                        Spacer()
                        ControlView(isPaused: isPaused)
                        Spacer()
                        BottomView(calories: 254, heartRate: 180)
                    })
                    .frame(width: screenWidth, height: screenHeight, alignment: .center)
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
        progressInSeconds += 0.01
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
    var isPaused: Bool
    var actionIcon: String{
        if isPaused{
            return "playIcon"
        }else{
            return "pauseIcon"
        }
    }
    var spacerLength: CGFloat{
        return (screenWidth - 164)/2
    }
    var body: some View {
        HStack(alignment: .center){
            Spacer(minLength: spacerLength)
            ZStack(alignment: .center, content: {
                Button(action: {}, label: {
                })
                .blur(radius: 10)
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                .clipped()
                Image("previousIcon")
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: .center)
            })
               .frame(width: 40, height: 40, alignment: .center)
               .clipped()
               .cornerRadius(20)
            Spacer(minLength: 10)
            Button(action: {actionPressed()}, label: {
                ZStack{
                    Button(action: {}, label: {
                    })
                    .blur(radius: 10)
                    .frame(width: 58, height: 58, alignment: .center)
                    .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                    .clipped()
                    Image("pauseIcon")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                }
                
            })
                .frame(width: 58)
                .clipped()
                .cornerRadius(58)
            Spacer(minLength: 10)
            ZStack(alignment: .center, content: {
                Button(action: {}, label: {
                })
                .blur(radius: 10)
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                .clipped()
                Image("nextIcon")
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: .center)
            })
               .frame(width: 40, height: 40, alignment: .center)
               .clipped()
               .cornerRadius(20)
               Spacer(minLength: spacerLength)
        }
        .frame(width: screenWidth, height: 58, alignment: .center)
        .scaledToFill()
    }
    
    private func previousPressed(){
        debugPrint("Previous Pressed")
    }
    private func actionPressed(){
        
    }
    private func nextPressed(){
        
    }
}

struct BottomView: View {
    var calories: Int
    var heartRate: Int
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
            .frame(alignment: .leading)
            .padding(.leading, 10)
            Spacer()
            HStack{
                Text(String(calories))
                    .font(.system(size: 20, weight: .medium, design: .default))
                Image("calorieBurnIco")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
            .frame(alignment:.trailing)
            .padding(.trailing, 10)
        }
        .frame(width: screenWidth, height: nil, alignment: .center)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        .padding(.bottom, 10)
    }
}


struct TextView: View {
    var totalSetTime: Int
    var progressInSeconds: CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Text("OU7")
                .font(.system(size: 17, weight: .medium, design: .default))
                .padding(.leading, 16)
                .padding(.top, 8)
            Text(":\(totalSetTime - Int(progressInSeconds))")
                    .font(.system(size: 44, weight: .bold, design: .default))
            Text("The name of the TrainingThe name of the Training")
                .foregroundColor(.white)
                .opacity(0.8)
                .lineLimit(nil)
                .font(.system(size: 12, weight: .bold, design: .default))
        })
        .frame(width: WKInterfaceDevice.current().screenBounds.width, height: nil, alignment: .leading)
    }
}
