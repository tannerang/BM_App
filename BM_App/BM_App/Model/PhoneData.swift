import Foundation

struct PhoneData: Codable {
    let price_with_currency: String
    let grade: String
    let merchant: Merchant
    let id: Int
}

struct Merchant: Codable {
    let company: String
}
