
import Foundation

struct UsersListEntity: Codable {
    let data: [UserEntity]?

    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - Datum
struct UserEntity: Codable {
    let id: Int?
    let email, firstName, avatar, lastName: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
