//
//  ShapesViewController.swift
//  Taller2
//
//  Created by Andres Chango on 3/12/23.
//

import UIKit
import Shapes

typealias ShapeOperator = (Double,Double?) -> String

class ShapesViewController: UIViewController, UITextFieldDelegate {
    
    let shapesArray = ["Cuadrado", "Rectangulo", "Circulo"]
    let shapesModel = GeometricAreaCalculator()
    var shapeSelected = ""
    let calculator = GeometricAreaCalculator()
    var square : ShapeOperator = { side, _  in
        let calculator = GeometricAreaCalculator()
        let value =  calculator.areaCalculator(shape: .square(side: side))
        return value.1
    }
    var circle :ShapeOperator = { radius, _ in
        let calculator = GeometricAreaCalculator()
        let value =  calculator.areaCalculator(shape: .circle(radius: radius))
        return value.1
    }
    var rectangle :ShapeOperator = { width, height in
        let calculator = GeometricAreaCalculator()
        let value =  calculator.areaCalculator(shape: .rectangle(weight: width, height: height ?? 0))
        return value.1
    }
    @IBOutlet weak var shapeImage: UIImageView!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var shapesSelector: UITextField!
    private var shapePicker: UIPickerView! = UIPickerView()
    @IBOutlet weak var firstParameterLabel: UILabel!
    @IBOutlet weak var secondParameterLabel: UILabel!
    @IBOutlet weak var firstParameterTextField: UITextField!
    @IBOutlet weak var secondParameterTextField: UITextField!
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var continueButton: UIButton!{
        didSet {
            continueButton.layer.cornerRadius = 10.0
            continueButton.isEnabled = false
        }
    }
    
    @IBAction func calculate(_ sender: Any) {
        calculateShape(shape: self.shapeSelected)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        shapePicker.delegate = self
        shapePicker.dataSource = self
        self.shapesSelector.inputView = shapePicker
        firstParameterTextField.delegate = self
        secondParameterTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        firstParameterLabel.isHidden = true
        firstParameterTextField.isHidden = true
        secondParameterLabel.isHidden = true
        secondParameterTextField.isHidden = true
        resultLabel.isHidden = true
        continueButton.isEnabled = false
    }
    
    func configureViewWith (shape : String) {
        switch shape {
        case "Cuadrado":
            showSquare()
            break
        case "Rectangulo":
            showRectangle()
            break
        case "Circulo":
            showCircle()
            break
        default :
            print("No se encontró figura")
        }
    }
    
    func showSquare() {
        firstParameterLabel.isHidden = false
        firstParameterTextField.isHidden = false
        secondParameterLabel.isHidden = true
        secondParameterTextField.isHidden = true
        firstParameterLabel.text = "Ingrese Lado"
        shapeImage.image = UIImage(named: "cuadrado")
        shapeImage.contentMode = .scaleAspectFit
        continueButton.isEnabled = true
    }
    
    func showRectangle(){
        firstParameterLabel.isHidden = false
        firstParameterTextField.isHidden = false
        secondParameterLabel.isHidden = false
        secondParameterTextField.isHidden = false
        secondParameterLabel.text = "Ingrese Ancho"
        firstParameterLabel.text = "Ingrese Largo"
        shapeImage.image = UIImage(named: "rectangulo")
        shapeImage.contentMode = .scaleAspectFit
        continueButton.isEnabled = true
    }
    func showCircle(){
        firstParameterLabel.isHidden = false
        firstParameterTextField.isHidden = false
        secondParameterLabel.isHidden = true
        secondParameterTextField.isHidden = true
        firstParameterLabel.text = "Ingrese Radio"
        shapeImage.image = UIImage(named: "circulo")
        shapeImage.contentMode = .scaleAspectFit
        continueButton.isEnabled = true
    }
    
    
    
    func calculateShape(shape : String) {
        let param1 = Double(firstParameterTextField.text ?? "0") ?? 0
        let param2 = Double(secondParameterTextField.text ?? "0") ?? 0
        var result = ""
        switch shape {
        case "Cuadrado":
            result = self.calculator.areaCalculator(shape: .square(side: param1)).1
            break
        case "Rectangulo":
            result = self.calculator.areaCalculator(shape: .rectangle(weight: param1, height: param2)).1
            break
        case "Circulo":
            result = self.calculator.areaCalculator(shape: .circle(radius: param1)).1
        default :
            print("No se encontró figura.")
        }
        resultLabel.isHidden = false
        resultLabel.text = result
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
}

extension ShapesViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shapesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shapesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        shapesSelector.text = shapesArray[row]
        self.configureViewWith(shape : shapesArray[row])
        self.shapeSelected = shapesArray[row]
        shapesSelector.resignFirstResponder()
    }
}
