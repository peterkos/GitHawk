//
//  PreferredRepositoryView.swift
//  Freetime
//
//  Created by Peter Kos on 7/12/19.
//  Copyright © 2019 Ryan Nystrom. All rights reserved.
//

import Foundation

// Raw values are intended for UserDefaults storage, as the UI is generated separately in the storyboard.
// @TODO: Better name
enum PreferredRepositoryView: String, RawRepresentable {
	case Overview = "Overview"
	case Issues = "Issues"
	case PullRequests = "Pull Requests"
	case Code = "Code"

	static var defaultView: PreferredRepositoryView {
		return UserDefaults.standard.defaultRepositoryView
	}
}
