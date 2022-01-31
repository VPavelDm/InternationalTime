//
//  SpeakTogether.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 31.01.22.
//

import Foundation
import GroupActivities

struct SpeakTogether: GroupActivity {
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = "Speak together"
        metadata.type = .generic
        return metadata
    }
}
