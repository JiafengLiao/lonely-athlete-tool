import Foundation

enum TestType: String, Codable, CaseIterable {
    case randomStart = "Random Start"
    case vertical = "Vertical Test"
    case speed = "Speed Test"
    case countdown = "Countdown Flash"
}
