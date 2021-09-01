//
//  AIUser.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/19.
//

import Foundation
import UIKit
class AIUser: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    struct PropertyKey {
        static let firstNameKey = "firstName"
        static let lastNameKey = "lastName"
        static let emailKey = "email"
        static let passwordKey = "password"
        static let iconKey = "iconKey"
    }
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var icon: UIImage? = UIImage(named: "gtl")
    init(firstName fm: String?, lastName lm: String?, email em: String?, password pw: String?) {
        super.init()
        firstName = fm
        lastName = lm
        email = em
        password = pw
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(firstName, forKey: PropertyKey.firstNameKey)
        coder.encode(lastName, forKey: PropertyKey.lastNameKey)
        coder.encode(email, forKey: PropertyKey.emailKey)
        coder.encode(password, forKey: PropertyKey.passwordKey)
        coder.encode(icon,forKey: PropertyKey.iconKey)
    }
    
    required init?(coder: NSCoder) {
        firstName = coder.decodeObject(forKey: PropertyKey.firstNameKey) as? String
        lastName = coder.decodeObject(forKey: PropertyKey.lastNameKey) as? String
        email = coder.decodeObject(forKey: PropertyKey.emailKey) as? String
        password = coder.decodeObject(forKey: PropertyKey.passwordKey) as? String
        icon = coder.decodeObject(forKey: PropertyKey.iconKey) as? UIImage
    }
    
}
