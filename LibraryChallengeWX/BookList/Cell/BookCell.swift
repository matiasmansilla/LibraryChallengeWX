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
  @IBOutlet weak var cellViewContainer: UIView!
  @IBOutlet weak var cellMainViewContainer: UIView!
  
  // MARK: - Properties
  var isLogoLoaded: Bool?
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  // MARK: - Methods
  func loadExperience(with item: BookViewModel) {
    //Corner Radius And Sahdow Container View
    cellMainViewContainer.layer.cornerRadius = 5.0
    cellMainViewContainer.layer.masksToBounds = false
    cellMainViewContainer.layer.shadowColor = UIColor.black.cgColor
    cellMainViewContainer.layer.shadowOffset = CGSize(width: 4, height: 4)
    cellMainViewContainer.layer.shadowOpacity = 0.2
    cellMainViewContainer.layer.shadowRadius = 5.0
    //Corner Radius Internal View
    cellViewContainer.layer.cornerRadius = 5.0
    cellViewContainer.layer.masksToBounds = true

    let titleAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray,
                           NSAttributedString.Key.font : UIFont(name: "montserrat-medium", size: 14) ?? UIFont()]
    let subTitleAttributes = [NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                              NSAttributedString.Key.font : UIFont(name: "Montserrat-Regular", size: 12) ?? UIFont()]
    
    titleLabel?.attributedText = NSAttributedString(string: item.book?.title ?? "", attributes: titleAttributes)
    subTilteLabel?.attributedText = NSAttributedString(string: item.book?.author ?? "", attributes: subTitleAttributes)
    guard let logoImageData = item.bookImageData else { return }
    if let image = UIImage(data: logoImageData) {
      DispatchQueue.main.async {
        self.logoImage?.image = image
      }
    }
  }
  
  //workaround to async images when reuse cells
  override func prepareForReuse() {
    super.prepareForReuse()
    logoImage?.image = UIImage(named: "library_logo")
  }
}
