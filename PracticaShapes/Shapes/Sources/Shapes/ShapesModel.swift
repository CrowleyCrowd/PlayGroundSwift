//
//  File.swift
//  
//
//  Created by Andres Chango on 23/11/23.
//

import Foundation

struct Square: ShapesProtocol {

    let side: Double

    var area: Double {
        return side * side
    }
    func description() -> String {
        return "El area del cuadrado de lado \(side)es :\(area)"
    }

}

struct Rectangle: ShapesProtocol {
    let width: Double
    let height: Double

    var area: Double {
        return width * height
    }
    func description() -> String {
        return "El area del rectangulo de ancho \(width) y largo \(height)es :\(area)"
    }
}

struct Rhombus: ShapesProtocol {
    let d1: Double
    let d2: Double

    var area: Double {
        return (d1 * d2) / 2
    }
    func description() -> String {
        return "El area del rombo de Diagonal \(d1) y diagonal menor \(d2) es :\(area)"
    }
}

struct Circle: ShapesProtocol {
    let radius: Double

    // A = π * r^2
    var area: Double {
        return .pi * radius * radius

    }
    func description() -> String {
        return "El area del circulo de radio \(radius) es:\(area)"
    }
}
