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
    static var dear: Dear?
    static var name: String?
    static var thank: Thank?
    static var decruit: Decruit?
    static var bye: Bye?
}
