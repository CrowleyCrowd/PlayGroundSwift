//
//  ViewController.swift
//  FourthClassPractice
//
//  Created by Usuario invitado on 13/12/23.
//

import UIKit

protocol AddPersonProtocol {
    func addPerson( name : String)
}

class ViewController: UIViewController {
    
    var personArray : [String] = ["Primero"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func goToAddPerson(_ sender: Any) {
        performSegue(withIdentifier: "addPerson", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            vc.delegate = self
        }
    }


}

extension ViewController : AddPersonProtocol {
    func addPerson(name: String) {
        self.personArray.append(name)
        print(personArray)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.personArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell

                if( !(cell != nil))
                {
                    cell = UITableViewCell(style: .default, reuseIdentifier: "CustomCell")
                }

        cell!.textLabel?.text = self.personArray[indexPath.row]
                return cell!
    }
}
