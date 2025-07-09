//
//  WeeklyChart.swift
//  Loggr
//
//  Created by Cam Scoglio on 7/7/25.
//

import SwiftUI

struct Constants {
static let ColorsPurple: Color = Color(red: 0.69, green: 0.32, blue: 0.87)
}

struct WeeklyChartView: View {
    
    @State private var weeklyBarHeights: [CGFloat] = [110, 160, 80, 100, 50, 160, 90]
    
    var body: some View {
        
        //Background
        LinearGradient(
                 stops: [
                     Gradient.Stop(color: Color(red: 0.26, green: 0.18, blue: 0.35), location: 0.00),
                     Gradient.Stop(color: Color(red: 0.11, green: 0.11, blue: 0.2), location: 1.00),
                 ],
                 startPoint: UnitPoint(x: 0.03, y: 0.01),
                 endPoint: UnitPoint(x: 0.93, y: 0.96)
             )
         .ignoresSafeArea()
         .overlay(
        
        
            
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
            .frame(width: 350, height: 280)
            .position(x: 200, y: 250)
            .scaleEffect(x: 1, y: 1)
            
            
            
        )
            
        
       
    }
}
    

#Preview {
    WeeklyChartView()
}
