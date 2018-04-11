//
//  Composer.swift
//  decruiter
//
//  Created by Marcus on 07.04.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Foundation


protocol ComposerDelegate: class {
    func updateMessage()
}

enum Dear: String {
    case mr = "Herr"
    case mrs = "Frau"
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
    
    static var data = [
        "Herr oder Frau?",
        "Nachname",
        "Danken Sie für die Anfrage.",
        "Sind Sie bereit für etwas Neues?",
        "Bedanken Sie sich."
    ]
    
    class func updateDear(_ dear: Dear) {
        data.insert(dear.rawValue, at: 0)
    }
    class func updateName(_ name: String) {
        data.insert(name, at: 1)
    }
    class func updateThank(_ thank: Thank) {
        data.insert(thank.rawValue, at: 2)
    }
    class func updateDecruit(_ decruit: Decruit) {
        data.insert(decruit.rawValue, at: 3)
    }
    class func updateBye(_ bye: Bye) {
        data.insert(bye.rawValue, at: 4)
    }
}
