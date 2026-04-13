import Foundation

struct TestRecord: Identifiable, Codable {
    let id: UUID
    let type: TestType
    let value: Double
    let unit: String
    let date: Date

    init(id: UUID = UUID(), type: TestType, value: Double, unit: String, date: Date = Date()) {
        self.id = id
        self.type = type
        self.value = value
        self.unit = unit
        self.date = date
    }
}
