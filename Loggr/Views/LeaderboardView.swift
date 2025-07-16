//
//  LeaderboardEntry.swift
//  Loggr
//
//  Created by Cam Scoglio on 7/9/25.
//
import SwiftUI


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct LeaderboardView: View {
    
    @ObservedObject var entryData = ReadJsonData()
    @State private var scrollOffset: CGFloat = 0
    var scaleFactor: CGFloat {
        let minScale: CGFloat = 0.4
        let maxScale: CGFloat = 1
        let threshold: CGFloat = 200
        
        if scrollOffset < 0 {
            return max(minScale, maxScale - (abs(scrollOffset) / threshold))
        }
        return maxScale
    }
    
    var body: some View {
        ZStack {
            
            ScrollView {
                GeometryReader { geometry in
                   
                    VStack {
                        
                        ZStack {
                            //Header
                            Text("Leaderboards")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            
                        }
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.clear)
                            
                                .background(
                                    AngularGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67).opacity(0), location: 0.14),
                                            Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67), location: 0.36),
                                            Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67).opacity(0), location: 0.63),
                                            Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67), location: 0.75),
                                        ],
                                        center: UnitPoint(x: 0.5, y: 0.5),
                                        angle: Angle(degrees: 90)
                                    )
                                )
                                .cornerRadius(252)
                                .blur(radius: 100)
                            
                            if let firstEntry = entryData.entries.first {
                                LeaderCard(
                                    name: firstEntry.name,
                                    currentProject: firstEntry.currentProject,
                                    currentTime: firstEntry.currentTime,
                                    image: firstEntry.image,
                                    scaleFactor: scaleFactor
                                )
                                .scaleEffect(0.8)
                            }
                        }
                        
                        ZStack {
                            VStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(maxWidth: .infinity, maxHeight: 1)
                                    .background(
                                        LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: .white.opacity(0), location: 0.09),
                                                Gradient.Stop(color: .white.opacity(0.5), location: 0.50),
                                                Gradient.Stop(color: .white.opacity(0), location: 0.89),
                                            ],
                                            startPoint: UnitPoint(x: 0.99, y: 0),
                                            endPoint: UnitPoint(x: 0, y: 0)
                                        )
                                    )
                                
                                HStack {
                                    HStack {
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(Color.white)
                                        
                                        Text("Daily")
                                            .font(
                                                Font.custom("Inter", size: 18)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color.white)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 30)
                                    
                                    
                                    Image("TapEllipse")
                                        .frame(width: 48, height: 5)
                                        .background(.black.opacity(0.3))
                                    
                                    
                                    ZStack {
                                        
                                        
                                        Circle()
                                            .fill(Color(red: 0.13, green: 0.1, blue: 0.2))
                                            .overlay(
                                                
                                                Circle()
                                                    .stroke(Color(.gray.opacity(0.1)))
                                                
                                            )
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                            .frame(width: 29, height: 29)
                                        
                                        Image(systemName: "person.badge.plus")
                                            .foregroundColor(.white)
                                            .opacity(0.7)
                                            .scaleEffect(0.9)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 30)
                                    
                                }
                                
                            }
                        }
                        .frame(height: 40)
                        
                        
                        ZStack {
                            
                            Rectangle()
                              .foregroundColor(.clear)
                              
                              .background(
                                AngularGradient(
                                  stops: [
                                    Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67).opacity(0), location: 0.14),
                                    Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67), location: 0.36),
                                    Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67).opacity(0), location: 0.63),
                                    Gradient.Stop(color: Color(red: 0.38, green: 0.18, blue: 0.67), location: 0.75),
                                  ],
                                  center: UnitPoint(x: 0.5, y: 0.5),
                                  angle: Angle(degrees: 90)
                                )
                              )
                              .cornerRadius(352)
                              .blur(radius: 100)
                            
                            LazyVStack(spacing: 6) {
                                ForEach(entryData.entries) { entry in
                                    EntryCard(name: entry.name, currentProject: entry.currentProject, currentTime: entry.currentTime, image: entry.image)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                        .preference(key: ScrollOffsetPreferenceKey.self,
                                    value: geometry.frame(in: .named("scroll")).minY)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = value
            }
        }
        .background(
        LinearGradient(
        stops: [
        Gradient.Stop(color: Color(red: 0.26, green: 0.18, blue: 0.35), location: 0.00),
        Gradient.Stop(color: Color(red: 0.11, green: 0.11, blue: 0.2), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.03, y: 0.01),
        endPoint: UnitPoint(x: 0.93, y: 0.96)
        )
        )
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryListView()
    }
}
