//
//  MyLogsView.swift
//  Loggr
//
//  Created by Cam Scoglio on 7/7/25.
//

import SwiftUI

struct Constants {
static let ColorsPurple: Color = Color(red: 0.69, green: 0.32, blue: 0.87)
static let DeepPurple: Color = Color(red: 0.19, green: 0.12, blue: 0.32)
static let FruityPurple: Color = Color(red: 0.69, green: 0.45, blue: 0.95)
}

struct WeeklyChartView: View {
    
    @State private var weeklyBarHeights: [CGFloat] = [110, 160, 80, 100, 50, 160, 90]
    @State var streak: Int = 10
    @State var currentProject: String = "TutorLaunch"
    @State var todo1: String = "Build Loggr UI"
    @State var todo2: String = "Poop on yo mama"
    @State var todo3: String = "Build Pooper"
    @State var currentTask: String = "Poopaloopa"
    @State var estimatedTime: Int = 16
    @State var currentTaskTime: Int = 16
    
    var currentProgress: Float {
        return Float(currentTaskTime) / Float(estimatedTime) * 326}
    
    var body: some View {
        
        //Background
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.26, green: 0.18, blue: 0.35), location: 0.00),
                Gradient.Stop(color: Color(red: 0.20, green: 0.05, blue: 0.3), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.03, y: 0.01),
            endPoint: UnitPoint(x: 0.93, y: 0.96)
        )
        .ignoresSafeArea()
        .overlay(
            
            
            VStack {
                
                //Header
                Text("My Logs")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(.white)
                //Weekly Widget (Rectangle)
                ZStack (alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Constants.ColorsPurple)
                    
                        .shadow(color: Color(red: 0.05, green: 0.04, blue: 0.17)
                            .opacity(1.0),
                                radius: 16.35,
                                x: 0, y: 1.38)
                    
                    //Headers + Chart
                    VStack {
                        
                        //"Work" + WeeklyDropdown
                        HStack {
                            
                            Text("Work")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            
                            //Weekly + Dropdown
                            HStack {
                                Image(systemName: "chevron.down")
                                
                                
                                Text("Weekly")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            
                        }
                        .frame(width: 320, height: 20)
                        .padding(.bottom, 23)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        //Y-Axis and Chart
                        HStack {
                            
                            //Y- Axis-Labeling
                            VStack
                            {
                                //Text
                                
                                
                                
                                Text("12")
                                
                                Spacer();
                                
                                Text("9")
                                
                                Spacer();
                                
                                Text("6")
                                
                                Spacer();
                                
                                Text("3")
                                
                                Spacer();
                                
                                Text("0")
                            }
                            .font(Font.custom("Inter", size: 12))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 175)
                            .padding(.bottom, 20)
                            .padding(.leading, 10)
                            
                            
                            Spacer()
                            
                            //Bars, Lines, and X-Axis-Labeling
                            VStack {
                                
                                //Bars and Lines
                                ZStack {
                                    
                                    //Lines
                                    GeometryReader { geometry in
                                        VStack {
                                            Path { path in
                                                let height = geometry.size.height
                                                let width = geometry.size.width
                                                
                                                // Line 1: Top (y = 0)
                                                path.move(to: CGPoint(x: 0, y: 0))
                                                path.addLine(to: CGPoint(x: width, y: 0))
                                                
                                                // Line 2: 1/4 down
                                                path.move(to: CGPoint(x: 0, y: height * 0.25))
                                                path.addLine(to: CGPoint(x: width, y: height * 0.25))
                                                
                                                // Line 3: 1/2 down (middle)
                                                path.move(to: CGPoint(x: 0, y: height * 0.5))
                                                path.addLine(to: CGPoint(x: width, y: height * 0.5))
                                                
                                                // Line 4: 3/4 down
                                                path.move(to: CGPoint(x: 0, y: height * 0.75))
                                                path.addLine(to: CGPoint(x: width, y: height * 0.75))
                                                
                                                
                                                
                                            }
                                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                            .foregroundColor(Color(.white))
                                            
                                            
                                            
                                            Path { path in
                                                let height = geometry.size.height
                                                let width = geometry.size.width
                                                
                                                // Line 5: Bottom (y = height)
                                                path.move(to: CGPoint(x: 0, y: height/2.15))
                                                path.addLine(to: CGPoint(x: width, y: height/2.15))
                                            }
                                            .stroke(style: StrokeStyle(lineWidth: 2.5))
                                            .foregroundColor(Color(.white))
                                            
                                            
                                            
                                        }
                                    }
                                    .frame(width: 284.0, height: 160)
                                    
                                    
                                    //Bars
                                    GeometryReader { geo in
                                        let spacing = (geo.size.width - (7 * 18)) / 6
                                        
                                        
                                        //Bar-Spacing
                                        HStack(alignment: .bottom, spacing: spacing) {
                                            
                                            // 2) iterate over your barHeights array
                                            ForEach(weeklyBarHeights.indices, id: \.self) { i in
                                                Rectangle()
                                                    .frame(width: 18,
                                                           height: weeklyBarHeights[i])
                                                    .cornerRadius(4.84)
                                            }
                                        }
                                        .frame(width: geo.size.width,
                                               height: geo.size.height)
                                        .foregroundColor(Color(red: 0.94, green: 0.9, blue: 0.99))
                                    }
                                    
                                }
                                .frame(width: 284.0, height: 160)
                                
                                //Text
                                HStack {
                                    Text("SUN")
                                    
                                    Spacer();
                                    
                                    Text("MON")
                                    
                                    Spacer();
                                    
                                    Text("TUE")
                                    
                                    Spacer();
                                    
                                    Text("WED")
                                    
                                    Spacer();
                                    
                                    Text("THU")
                                    
                                    Spacer();
                                    
                                    Text("FRI")
                                    
                                    Spacer();
                                    
                                    Text("SAT")
                                    
                                }
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .font(Font.custom("Inter", size: 8.30025))
                                .fontWeight(.black)
                                .frame(width: 284, height: 10.10968)
                                
                            }
                            
                            
                            
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 20)
                        .padding(.bottom, 5)
                    }
                    
                }
                .frame(width: 360, height: 280)
                .scaleEffect(x: 1, y: 1)
                
                //Middle two widgets
                HStack {
                    Spacer()
                    
                    //Streak Widget
                    ZStack {
                        //Background
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Constants.DeepPurple)
                            .shadow(color: .black.opacity(0.25), radius: 1.58621, x: 0, y: 3.17241)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white.opacity(0.5), lineWidth: 0.7931))
                            .frame(width: 150, height: 204)
                        
                        //Components of Streak Widget
                        VStack {
                            
                            Image("Streak Icon")
                                .shadow(color: Color.black, radius: 3, x: 2, y: 5)
                                
                            
                            Text("Streak")
                                .font(
                                    //Change Font to be in Library
                                    .system(size: 15, weight: .semibold, design: .default)
                                )
                                .background(
                                        Text("Streak")
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundColor(.black)
                                            .offset(x: 1, y: 1)
                                            .opacity(0.6)
                                    )
                                .kerning(0.374)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .opacity(0.44)
                               
                            
                            Text("\(streak) Days")
                                .font(
                                    .system(size: 34, weight: .semibold, design: .default)

                                )
                                .background(
                                        Text("\(streak) Days")
                                            .font(.system(size: 34, weight: .semibold))
                                            .foregroundColor(.black)
                                            .offset(x: 1, y: 1)
                                    )
                                .padding(.top, 5)
                                .kerning(0.374)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .shadow(color: Color.black, radius: 5, x: 2, y: 5)
                        
                        }
                        
                    }
                    
                //Current Proj To-Do List Widget
                
                ZStack {
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Constants.FruityPurple)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.45, green: 0.25, blue: 0.76), lineWidth: 1)
                        )
                        .frame(width: 200, height: 204)
                    
                    
                    VStack (alignment: .leading) {
                        HStack {
                            
                            Text("Current Project:")
                                .font(
                                    .system(size: 17, weight: .semibold, design: .default)

                                )
                                .background(
                                        Text("Current Project:")
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.black)
                                            .offset(x: 1, y: 1)
                                    )
                                .kerning(0.374)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            
                               
                                
                            
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                                .padding(.trailing, 30)
                        }
                        
                        .frame(width: 200, height: 15)
                        
                        //Current Task (set variable)
                        Text(currentProject)
                            .font(
                                .system(size: 15, weight: .medium, design: .default)

                            )
                            
                            
                            .kerning(0.374)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .opacity(0.82)
                           
                        //To-Do
                        VStack (alignment: .leading) {
                            Spacer()
                            
                            //To-Do List
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .frame(width: 20, height: 20)
                                   
                                Text(todo1)
                                    .font(
                                        .system(size: 15, weight: .semibold, design: .default)

                                    )
                                    .kerning(0.374)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)

                                    .opacity(0.74)
                                
                            }
                  
                            Spacer()
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .frame(width: 20, height: 20)
                                   
                                Text(todo2)
                                    .font(
                                        .system(size: 15, weight: .semibold, design: .default)

                                    )
                                    .kerning(0.374)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)

                                    .opacity(0.74)
                                
                            }
                            Spacer()
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .frame(width: 20, height: 20)
                                   
                                Text(todo3)
                                    .font(
                                        .system(size: 15, weight: .semibold, design: .default)

                                    )
                                    .kerning(0.374)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)

                                    .opacity(0.74)
                                
                            }
                            Spacer()
                            
                        }
                        .frame(width: 180, height: 114)
                        
                        
                        
                        
                        
                    }
                    .padding(.leading, 20)
                    
                    .frame(width: 200, height: 204)
                }
                Spacer()
            } //Hstack for middle rectangles
                
                
                
                //Current Task Widget
                ZStack {
                    //Current Task Widget
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Constants.DeepPurple)
                        .shadow(color: .black.opacity(0.25), radius: 1.58621, x: 0, y: 3.17241)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white.opacity(0.5), lineWidth: 0.7931))
                        .frame(width: 360, height: 204)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Current Task:")
                              .font(
                                .system(size: 25, weight: .semibold, design: .default)

                              )
                              .kerning(0.27635)
                              .multilineTextAlignment(.center)
                              .foregroundColor(.white)
                              .background(
                                Text("Current Task:")
                                  .font(
                                    .system(size: 25.2, weight: .semibold, design: .default)

                                  )
                                  .kerning(0.27635)
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(.black)
        
                              )
                              .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                            
                            
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color.white)
                                .padding(.trailing, 45)
                        }
                        
                        .frame(width: 360, height: 50)
                        
                        Text("\(currentTask)")
                            .font(
                              .system(size: 15, weight: .semibold, design: .default)

                            )
                        .kerning(0.374)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                        
                        Spacer()
                        
                        VStack (alignment: .trailing){
                            
                            //Set this as a variable for easy calcs
                            Text("Estimated Time: \(estimatedTime) hours")
                                .font(
                                  .system(size: 10, weight: .semibold, design: .default)

                                )
                                .kerning(0.174)
                                .foregroundColor(.white)
                            
                            //Progress Bar
                            ZStack (alignment: .leading) {
                                RoundedRectangle(cornerRadius: 200)
                                    .fill(Color(Constants.DeepPurple))
                                    .frame(width: 326, height: 60)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 200)
                                            .stroke(Color.white.opacity(0.1), lineWidth: 1.58621)
                                    )
                                    .shadow(color: .black.opacity(0.25), radius: 1.58621, x: 0, y: 3.17241)
                                
                                RoundedRectangle(cornerRadius: 200)
                                    .fill(
                                        
                                        
                                        LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: .white, location: 0.00),
                                                Gradient.Stop(color: Color(red: 0.7, green: 0.46, blue: 0.95), location: 1.00),
                                            ],
                                            startPoint: UnitPoint(x: 1.38, y: 1),
                                            endPoint: UnitPoint(x: 0.36, y: 1)
                                        )
                                        
                                        
                                    )
                                //Variable: TaskProgress (width)
                                //TaskProgress = CurrentTimeInTask / TotalTaskTime
                                    .frame(width: CGFloat(currentProgress), height: 60)
                                    .overlay(
                                 
                                            RoundedRectangle(cornerRadius: 200)
                                                .stroke(Color.white.opacity(0.1), lineWidth: 1.58621)
                                        
                                    )
                                    .shadow(color: .black.opacity(0.25), radius: 1.58621, x: 0, y: 3.17241)
                                
                                
                            }
                            VStack {
                                
                                
                                Rectangle()
                                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [1]))
                                        .frame(width: 1, height: 5)
                                        .foregroundColor(.white)
                                
                                Text("\(currentTaskTime)")
                                    .font(.system(size: 10, weight: .semibold, design: .default))
                                    .foregroundColor(.white)
                            }
                            //Progress Bar Formula for this
                            .padding(.trailing, CGFloat(326 - currentProgress + 25))
                            
                            
                            
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading, 40)
                }
                .frame(width: 360, height: 204)
                    
        }//Total Widget + "My Logs" VStack
        .padding(.top, 20)
            
        )//Ending overlay background
    }//body View
}//struct WeeklyChartView (final)
    

#Preview {
    WeeklyChartView()
}
