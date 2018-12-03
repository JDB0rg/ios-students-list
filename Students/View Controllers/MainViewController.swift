//
//  MainViewController.swift
//  Students
//
//  Created by Madison Waters on 9/17/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    
    @IBAction func sortStudents(_ sender: Any) {
        updateSort()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchStudents { (students, error) in
            if let error = error {
                NSLog("Error fetching Students\(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.students = students ?? []
            }
        }
    }

    func updateSort() {
        let sortedStudents: [Student]
        
        if sortSelector.selectedSegmentIndex == 0 {
            sortedStudents = students.sorted(by: { $0.firstName < $1.firstName})
        } else {
            sortedStudents = students.sorted(by: {($0.lastName ?? "") < ($1.lastName ?? "")})
        }
        studentsTableViewController.students = sortedStudents
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "EmbeddedStudentsVC" {
            studentsTableViewController = segue.destination as! StudentsTableViewController
        }
        // Pass the selected object to the new view controller.
    }
    
    private let networkClient = NetworkClient()
    
    private var students: [Student] = [] {
        didSet {
            updateSort()
        }
    }
    
    private var studentsTableViewController: StudentsTableViewController!

}
