//
//  BookCell.swift
//  ch15_cv_challenge
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import UIKit

class BookCell: UITableViewCell {
  // MARK: - Outlets
  @IBOutlet weak var logoImage: UIImageView?
  @IBOutlet weak var titleLabel: UILabel?
  @IBOutlet weak var subTilteLabel: UILabel?

  // MARK: - Properties
  var isLogoLoaded: Bool?
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  // MARK: - Methods
  func loadExperience(with item: BookViewModel) {
    titleLabel?.text = item.book?.title
    subTilteLabel?.text = item.book?.author
    guard let logoImageData = item.bookImageData else { return }
    if let image = UIImage(data: logoImageData) {
      DispatchQueue.main.async {
        self.logoImage?.image = image
      }
    }
  }
}
