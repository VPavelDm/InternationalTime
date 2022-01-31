//
//  AVAudioSession + hasPermissionToRecord.swift
//  InternationalTime
//
//  Created by Pavel Vaitsikhouski on 31.01.22.
//

import Foundation
import AVFoundation

extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}

