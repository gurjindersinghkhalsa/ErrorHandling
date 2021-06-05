//
//  ViewController.swift
//  ErrorHandling
//
//  Created by Gurjinder Singh on 02/06/21.
//

import UIKit

class ViewController: UIViewController,Alert {

    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var txtFieldName: UITextField!
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkViewModel()
    }
    
    // private Methods
    private func checkViewModel() {
        if self.viewModel == nil {
            self.viewModel = ViewModel()
        }
    }
    
    //IBAction Methods
    
    @IBAction func tapSubmit(_ sender: Any) {
        if let name = self.txtFieldName.text, let age = self.textFieldAge.text {
            do {
              let _ = try self.viewModel?.userTest(age: Int(age) ?? 0, name: name)
                present(self.showAlert(title: "App", message: "Validation passed"), animated: true, completion: nil)
            } catch UserDetailError.noValidAge {
                present(self.showAlert(title: "App", message: UserDetailError.noValidAge.description), animated: true, completion: nil)
            } catch UserDetailError.noValidName(let minChar) {
                present(self.showAlert(title: "App", message: UserDetailError.noValidName(minChar: minChar).description), animated: true, completion: nil)
            } catch UserDetailError.unexpected(let code) {
                print(UserDetailError.unexpected(code: code).description)
            } catch let error {
                print(error)
            }
        }
    }
    
}
