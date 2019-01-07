//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Jolene Lozano on 10/16/18.
//  Copyright © 2018 Jolene Lozano. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    @IBOutlet weak var saveBarButon: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var studentNameField: UITextField!
    var student: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if student == nil {
            student = ""
        }
        studentNameField.text = student
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            student = studentNameField.text
        }
    }

    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode { // modal segue
            dismiss(animated: true, completion: nil)
        } else { // show segue
            navigationController!.popViewController(animated: true)
        }
    }
}
