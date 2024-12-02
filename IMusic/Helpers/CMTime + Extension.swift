//
//  CMTime + Extension.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 09.04.2024.
//

import Foundation
import AVKit

extension CMTime {

    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return ""}
        let totalSecond = Int(CMTimeGetSeconds(self))
        let seconds = totalSecond % 60
        let minutes = totalSecond / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
}
