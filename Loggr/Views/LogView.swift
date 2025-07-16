import SwiftUI

struct LogView: View {
    
    @State var timerIsRunning: Bool = false
    @State private var timer: Timer?
    @State private var backgroundOpacity: Double = 1.0
    @State private var buttonOpacity: Double = 1.0
    @State var clockedTotalSeconds : Int = 37800
    var formattedTime: String {
            let hours = clockedTotalSeconds / 3600
            let minutes = (clockedTotalSeconds % 3600) / 60
            let seconds = clockedTotalSeconds % 60
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    
    var body: some View {
        

        
        ZStack {
           
                            
            Color.black
            
            Image("LogsBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .opacity(backgroundOpacity)
            
            
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.23, green: 0.25, blue: 0.33).opacity(0), location: 0.12),
            Gradient.Stop(color: Color(red: 0.23, green: 0.25, blue: 0.33).opacity(0.8), location: 0.60),
            ],
            startPoint: UnitPoint(x: 0.5, y: -0.16),
            endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .opacity(backgroundOpacity)
           
    
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .overlay(
            
            
            
            
            //Foreground
            
    
            VStack {
                
                
                
                Spacer()
                VStack {
                    Text("Loggr")
                        .font(
                            .system(size: 34, weight: .heavy, design: .default)
                        )
                        .kerning(2.74)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom, 3)
                    Text("Track Work Time")
                        .font(
                            .system(size: 17, weight: .semibold, design: .default)
                        )
                        .kerning(0.74)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
                
                Spacer()
                
                ZStack {
                    
                    Circle()
                        .fill(Constants.SchemesPrimary)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 3)
                        .frame(width: 300, height: 300)
                        .opacity(buttonOpacity)
                    
                    Button(action: {
                        if timerIsRunning {
                            backgroundOpacity = 1.0
                            buttonOpacity = 1.0
                            timer?.invalidate()
                            timer = nil
                            
                        } else {
                            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                                clockedTotalSeconds += 1
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    withAnimation(.easeInOut(duration: 5.0)) {
                                        backgroundOpacity = 0.0
                                        buttonOpacity = 0.3
                                    }
                                }
                        }
                        timerIsRunning.toggle()
                    }) {
                        
                        Circle()
                            .fill(.white)
                            .shadow(color: .black.opacity(0.8), radius: 2, x: 0, y: 3)
                            .frame(width: 200, height: 200)
                            .opacity(buttonOpacity)
                        
                    }
             
                    
                    
                    
                }
                
                Spacer()
                
                Text(formattedTime)
                  .font(
                    Font.custom("Inter", size: 34)
                  )
                  .kerning(2.74)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                
                Spacer()
                    
                        
                }
         
        )
//        .overlay(
//            // Add navigation as separate overlay
//            NavigationStack {
//                HStack {
//                    HStack {
//                        NavigationLink(destination: MyLogsView()) {
//                        Image(systemName: "chevron.left")
//                        Text("Logs")
//                            .font(.system(size: 20))
//                    }
//                    }
//                    Spacer()
//                    HStack {
//                        NavigationLink(destination: EntryListView()) {
//                        Text("Leaderboard")
//                            .font(.system(size: 20))
//                        Image(systemName: "chevron.right")
//                    }
//                    }
//                   
//                }
//                .padding(.horizontal)
//                .padding(.top)
//                Spacer()
//            }
//                .navigationTitle(Text("HELLO"))
//            .navigationBarHidden(true)
//            .padding(.horizontal, 60)
//                
//        )
    
    }
}


#Preview {
    LogView()
}
