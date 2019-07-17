//
//  Defaults+Reaction.swift
//  Freetime
//
//  Created by Ehud Adler on 7/30/18.
//  Copyright © 2018 Ryan Nystrom. All rights reserved.
//
extension UserDefaults {

	// Keys for default values
    private static let defaultReactionKey = "com.whoisryannystrom.freetime.default-reaction"
	private static let defaultRepositoryViewKey = "com.whoisryannystrom.freetime.default-repository-view"

	private static let disabledValue = "disabled"

    // Stores ReactionContent in string form but
    // accepts and returns in original form
    func setDefault(reaction: ReactionContent) {
        set(reaction.emoji, forKey: UserDefaults.defaultReactionKey)
    }

    func disableReaction() {
        set(UserDefaults.disabledValue, forKey: UserDefaults.defaultReactionKey)
    }

    var defaultReaction: ReactionContent? {
        // if value doesn't exist, first access, default to previous behavior of +1
        guard let value = string(forKey: UserDefaults.defaultReactionKey)
            else { return ReactionContent.thumbsUp }
        if value == UserDefaults.disabledValue {
            return nil
        } else {
            let reaction = value.reaction
            return reaction
        }
    }

	func setDefault(repositoryView: PreferredRepositoryView) {
		set(repositoryView.rawValue, forKey: UserDefaults.defaultRepositoryViewKey)
	}

	var defaultRepositoryView: PreferredRepositoryView {

		// If no previous view set, default to "Overview".
		guard let value = string(forKey: UserDefaults.defaultRepositoryViewKey) else {
			return .Overview
		}

		return PreferredRepositoryView(rawValue: value)!
	}

	// @FIXME: Rename and/or move file? This system is odd.

}
