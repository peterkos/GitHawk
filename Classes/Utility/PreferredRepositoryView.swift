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
enum PreferredRepositoryView: String {
	case Overview
	case Issues
	case PullRequests
	case Code
}
