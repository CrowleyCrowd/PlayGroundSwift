public struct GeometricAreaCalculator {
    public private(set) var text = "Hello, World!"

    public init() {
    }

    public func areaCalculator(shape: ShapesList) -> (Double, String) {
        var area = 0.0
        var description = ""
        switch shape {
        case .square(side: let side):
            let square =  Square(side: side)
            area = square.area
            description = square.description()
        case .rectangle(weight: let weight, height: let height):
            let rectangle = Rectangle(width:weight , height: height)
            area = rectangle.area
            description = rectangle.description()
        case .circle(radius: let radius):
            let circle = Circle(radius: radius)
            area = circle.area
            description = circle.description()
            print(circle.description())
        }
        return (area, description)
    }
}
