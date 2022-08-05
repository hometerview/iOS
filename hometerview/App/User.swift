//
//  User.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

class User: ObservableObject {
    enum Status {
        case unAuthenticated
        case authenticated
        case guest
    }

    static var shared = User()

    private let userDefaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    @Published open var status: User.Status = .unAuthenticated
    open var memberToken: MemberToken? = nil

    private init() {
        // User Default에 Token 유효성 검사
    }
}

extension User {
    open func setUserDefaults<T: Encodable>(key: String, value: T) {
        guard let data = try? encoder.encode(value) else {
            Log.error("User Defaults encoding 에러")
            return
        }

        userDefaults.set(data, forKey: key)
    }

    open func getUserDefaults<T: Decodable>(key: String) -> T? {
        guard let data = userDefaults.object(forKey: key) as? Data,
              let object = try? decoder.decode(T.self, from: data) else {
            Log.error("User Defaults decoding 에러")
            return nil
        }

        return object
    }

    private func checkHasToken() -> Bool {
        guard let memberToken: MemberToken = getUserDefaults(key: "token") else {
            return false
        }

        self.memberToken = memberToken

        return true
    }
}

struct MemberToken: Codable {
    var jwt: String
}
