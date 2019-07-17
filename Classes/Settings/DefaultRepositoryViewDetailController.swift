//
//  DefaultRepositoryViewDetailController.swift
//  Freetime
//
//  Created by Peter Kos on 7/12/19.
//  Copyright © 2018 Ryan Nystrom. All rights reserved.
//

import UIKit

protocol DefaultRepositoryViewDelegate: class {
	func didUpdateDefaultRepositoryView()
}

class DefaultRepositoryViewDetailController: UITableViewController {

	@IBOutlet weak var overviewCell: StyledTableCell!
	@IBOutlet weak var issuesCell: StyledTableCell!
	@IBOutlet weak var pullRequestsCell: StyledTableCell!
	@IBOutlet weak var codeCell: StyledTableCell!

    private var allRepositoryViewCells: [UITableViewCell] {
        return [overviewCell, issuesCell, pullRequestsCell, codeCell]
    }

    weak var delegate: DefaultRepositoryViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSavedRepositoryPreference()
    }

	// @FIXME: Might not need this? Or just return 1
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return enabledSwitch.isOn ? 2 : 1
//    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: trueUnlessReduceMotionEnabled)
        let cell = tableView.cellForRow(at: indexPath)

        switch cell {
		case overviewCell: updateDefault(preferredView: .Overview)
		case issuesCell: updateDefault(preferredView: .Issues)
		case pullRequestsCell: updateDefault(preferredView: .PullRequests)
		case codeCell: updateDefault(preferredView: .Code)
        default: break
        }
    }

    // MARK: Private API
    private func loadSavedRepositoryPreference() {

        let savedCell: UITableViewCell

		switch UserDefaults.standard.defaultRepositoryView {
        case .Overview: savedCell = overviewCell
		case .Issues: savedCell = issuesCell
		case .PullRequests: savedCell = pullRequestsCell
		case .Code: savedCell = codeCell
        }

        updateCells(cell: savedCell)
    }

    private func updateCells(cell: UITableViewCell) {
        rz_smoothlyDeselectRows(tableView: self.tableView)

        // Reset all to none
        allRepositoryViewCells.forEach { $0.accessoryType = .none }

        // Set proper cell to check
        cell.accessoryType = .checkmark
    }

    private func updateDefault(preferredView: PreferredRepositoryView) {
        UserDefaults.standard.setDefault(repositoryView: preferredView)
        loadSavedRepositoryPreference()
        delegate?.didUpdateDefaultRepositoryView()
    }

	// @FIXME: Might not need?
//    private func updateSections() {
//        tableView.performBatchUpdates({
//            if enabledSwitch.isOn {
//                self.tableView.insertSections(IndexSet(integer: 1), with: .top)
//            } else {
//                 self.tableView.deleteSections(IndexSet(integer: 1), with: .top)
//            }
//        }, completion: nil)
//    }
}