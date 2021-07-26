//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by William Bateman on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

// MARK: Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
// MARK: Properties
        var entry: Entry?

// MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
// MARK: Actions
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.update(entry: entry, title: title, body: bodyTextView.text, timeStamp: Date())
        } else {
            EntryController.shared.createEntryWith(title: title, body: bodyTextView.text)
        }
        navigationController?.popViewController(animated: true)
    }
    
// MARK: Helper Functions
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
    
} // End of Class

