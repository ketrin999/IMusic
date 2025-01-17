//
//  TrackCell.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 27.03.2024.
//

import UIKit
import SDWebImage

protocol TrackCellViewModel {
    var iconUrlString: String? { get }
    var trackName: String { get }
    var artistName: String { get }
    var collectionName: String { get }
}

class TrackCell: UITableViewCell {

    static let reuseId = "TrackCell"

    @IBOutlet weak var trackNameLabel: UILabel!

    @IBOutlet weak var artistNameLabel: UILabel!

    @IBOutlet weak var collectionNameLabel: UILabel!

    @IBOutlet weak var trackImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var addTrackOutlet: UIButton!

    override func prepareForReuse() {

        super.prepareForReuse()

        trackImageView.image = nil
    }

    var cell: SearchViewModel.Cell?

    func set(viewModel: SearchViewModel.Cell) {

        self.cell = viewModel

        let savedTrack = UserDefaults.standard.savedTracks()
        let hasFavourite = savedTrack.firstIndex(where: {
            $0.trackName == self.cell?.trackName && $0.artistName == self.cell?.artistName
        }) != nil
        if hasFavourite {
            addTrackOutlet.isHidden = true
        } else {
            addTrackOutlet.isHidden = false
        }

        trackNameLabel.text = viewModel.trackName
        artistNameLabel.text = viewModel.artistName
        collectionNameLabel.text = viewModel.collectionName

        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }

        trackImageView.sd_setImage(with: url, completed: nil)
    }

    @IBAction func addTrackAction(_ sender: Any) {

        let defaults = UserDefaults.standard
        guard let cell = cell else { return }
        addTrackOutlet.isHidden = true

        var listOfTracks = defaults.savedTracks()

        listOfTracks.append(cell)

        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: listOfTracks, requiringSecureCoding: false) {
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }

}
