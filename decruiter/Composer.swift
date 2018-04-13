//
//  Composer.swift
//  decruiter
//
//  Created by Marcus on 07.04.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Foundation

enum Dear: String {
    case mr = "Hallo Herr"
    case mrs = "Hallo Frau"
}

enum Thank: String {
    case thankYou = "Danke für Ihre Anfrage."
    case thankYouSoMuch = "Vielen Dank für Ihre Anfrage und Ihr Interesse an meinen Fähigkeiten."
}

enum Decruit: String {
    case never = "Ich bin nicht interessiert."
    case notAtTheMoment = "Im Moment bin ich nicht an einem Wechsel interessiert und muss Ihnen für die vakante Position leider absagen"
}

enum Bye: String {
    case kThxBye = "Viele Grüße,"
    case thankyouSOmuchBye = "Beste Grüße und vielen Dank,"
}

class Composer {
    
    static var updated = {}
    
    static var data = ["", "", "", "", ""] {
        didSet {
            updated()
        }
    }
    
    class func updateDear(_ dear: Dear) {
        data[0] = dear.rawValue
    }
    class func updateName(_ name: String) {
        data[1] = name
    }
    class func updateThank(_ thank: Thank) {
        data[2] = thank.rawValue
    }
    class func updateDecruit(_ decruit: Decruit) {
        data[3] = decruit.rawValue
    }
    class func updateBye(_ bye: Bye) {
        data[4] = bye.rawValue
    }
}
