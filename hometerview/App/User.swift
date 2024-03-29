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
        case guest; #warning("삭제 예정")
    }

    static var shared = User()

    private let userDefaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    @Published open var status: User.Status = .unAuthenticated
    open private(set) var memberToken: MemberToken? = nil

    private init() {
        if checkHasToken() {
            status = .authenticated
        } else {
            status = .unAuthenticated
        }
    }
}

extension User {
    public func setToken(_ memberToken: MemberToken) {
        setUserDefaults(key: .token, value: memberToken)
        self.memberToken = memberToken
    }

    public func setUserDefaults<T: Encodable>(key: UserDefaultsKeys, value: T) {
        guard let data = try? encoder.encode(value) else {
            Log.error("User Defaults encoding 에러")
            return
        }

        userDefaults.set(data, forKey: key.description)
    }

    public func getUserDefaults<T: Decodable>(key: UserDefaultsKeys) -> T? {
        guard let data = userDefaults.object(forKey: key.description) as? Data,
              let object = try? decoder.decode(T.self, from: data) else {
            Log.error("User Defaults decoding 에러 또는 해당 값 없음")
            return nil
        }

        return object
    }

    private func checkHasToken() -> Bool {
        guard let memberToken: MemberToken = getUserDefaults(key: UserDefaultsKeys.token) else {
            return false
        }

        self.memberToken = memberToken

        return true
    }
}
