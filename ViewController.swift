//
//  ViewController.swift
//  StudentList
//
//  Created by Jolene Lozano on 10/16/18.
//  Copyright © 2018 Jolene Lozano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Subraiz Ahmed",
                    "Jack Antico",
                    "Carter Beaulieu",
                    "Michael Burke",
                    "Stepan Cannuscio",
                    "Paige Carey",
                    "James Clark",
                    "Matthew Donovan",
                    "Caroline Downey",
                    "Anran Du",
                    "Griffin Elliott",
                    "Alexandro Forte",
                    "Dawson Gallay",
                    "Jacqueline Han",
                    "Joseph Langenderfer",
                    "Lok Lee",
                    "Yujiao Li",
                    "Emma Loughlin",
                    "Jolene Lozano",
                    "Jack Manoog",
                    "Benjamin Meisenzahl",
                    "Dylan Nadeau",
                    "Brennan Nugent",
                    "Nicholas OBrien Cannon",
                    "Jessica Olivieri",
                    "Peter Song",
                    "Rahul Tasker",
                    "John Wilson"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStudent" {
            let destination = segue.destination as! StudentDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.student = students[selectedIndexPath.row]
        } else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromStudentDetailViewController(segue: UIStoryboardSegue) {
        let source = segue.source as! StudentDetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            students[selectedIndexPath.row] = source.student
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: students.count, section: 0)
            students.append(source.student)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("👊 numberOfRowsInSection was just called and there are \(students.count) rows in the tableView")
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // print("👍👍 Dequeing the table view cell for indexPath.row = \(indexPath.row) where the cell contains item \(students[indexPath.row])")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
}

