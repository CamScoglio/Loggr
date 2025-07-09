import SwiftUI

struct HourlyWorkChartView: View {
    
    // Sample data for hourly work tracking - matching your design
    let workData: [HourlyWorkData] = [
        HourlyWorkData(hour: "9AM", value: 24, isHighlighted: false),
        HourlyWorkData(hour: "10AM", value: 60, isHighlighted: true),
        HourlyWorkData(hour: "11AM", value: 60, isHighlighted: true),
        HourlyWorkData(hour: "12PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "1PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "2PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "3PM", value: 36, isHighlighted: false),
        HourlyWorkData(hour: "4PM", value: 36, isHighlighted: false),
        HourlyWorkData(hour: "5PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "6PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "7PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "8PM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "9PM", value: 60, isHighlighted: true),
        HourlyWorkData(hour: "10PM", value: 60, isHighlighted: true),
        HourlyWorkData(hour: "11PM", value: 60, isHighlighted: true),
        HourlyWorkData(hour: "12AM", value: 60, isHighlighted: true),
        HourlyWorkData(hour: "1AM", value: 30, isHighlighted: false),
        HourlyWorkData(hour: "2AM", value: 12, isHighlighted: false),
        HourlyWorkData(hour: "3AM", value: 12, isHighlighted: false)
    ]
    
    @State private var selectedHour: String? = nil
    @State private var showTooltip = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Work")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    Text("Hourly")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 32)
            .padding(.bottom, 40)
            
            // Chart
            GeometryReader { geometry in
                let chartWidth = geometry.size.width - 80
                let chartHeight = geometry.size.height - 60
                
                ZStack {
                    // Grid lines
                    VStack(spacing: 0) {
                        ForEach(Array(stride(from: 60, through: 0, by: -15)), id: \.self) { value in
                            HStack {
                                Text("\(value)")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white.opacity(0.8))
                                    .frame(width: 25, alignment: .trailing)
                                
                                Rectangle()
                                    .fill(Color.white.opacity(0.3))
                                    .frame(height: 1)
                                    .overlay(
                                        Rectangle()
                                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                            .foregroundColor(.white.opacity(0.5))
                                    )
                            }
                            .frame(height: chartHeight / 4)
                        }
                    }
                    .padding(.leading, 40)
                    
                    // Chart bars
                    HStack(alignment: .bottom, spacing: 0) {
                        let barWidth: CGFloat = 18
                        let totalBars = workData.count
                        let totalSpacing = chartWidth - CGFloat(totalBars) * barWidth
                        let spacing = totalSpacing / CGFloat(totalBars - 1)
                        
                        ForEach(workData.indices, id: \.self) { index in
                            let data = workData[index]
                            let isSelected = selectedHour == data.hour
                            
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(data.isHighlighted ? Color.white : Color.white.opacity(0.6))
                                    .frame(
                                        width: barWidth,
                                        height: max(8, CGFloat(data.value) / 60.0 * chartHeight)
                                    )
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedHour = data.hour
                                        showTooltip = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            showTooltip = false
                                            selectedHour = nil
                                        }
                                    }
                            }
                            
                            if index < workData.count - 1 {
                                Spacer()
                                    .frame(width: spacing)
                            }
                        }
                    }
                    .padding(.leading, 65)
                    .padding(.trailing, 15)
                    
                    // Tooltip
                    if showTooltip, let selectedHour = selectedHour {
                        VStack {
                            HStack {
                                Spacer()
                                
                                VStack(spacing: 4) {
                                    Text(selectedHour)
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.black.opacity(0.8))
                                        )
                                    
                                    // Tooltip arrow
                                    Triangle()
                                        .fill(Color.black.opacity(0.8))
                                        .frame(width: 10, height: 6)
                                }
                                
                                Spacer()
                            }
                            .padding(.bottom, chartHeight * 0.3)
                            
                            Spacer()
                        }
                        .transition(.opacity.combined(with: .scale))
                        .animation(.easeInOut(duration: 0.2), value: showTooltip)
                    }
                }
            }
            .padding(.bottom, 20)
            
            // Time labels at bottom
            HStack {
                ForEach(["9AM", "12PM", "3PM", "6PM", "9PM", "12AM", "3AM"], id: \.self) { timeLabel in
                    Text(timeLabel)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                    
                    if timeLabel != "3AM" {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 20)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.7, green: 0.4, blue: 0.9),
                    Color(red: 0.5, green: 0.3, blue: 0.8)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
}

// Data model for hourly work tracking
struct HourlyWorkData {
    let hour: String
    let value: Int // minutes worked in that hour
    let isHighlighted: Bool // true for white bars, false for purple bars
}

// Custom triangle shape for tooltip arrow
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

// Preview
struct HourlyWorkChartView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWorkChartView()
            .frame(width: 350, height: 300)
            .previewLayout(.sizeThatFits)
    }
}
