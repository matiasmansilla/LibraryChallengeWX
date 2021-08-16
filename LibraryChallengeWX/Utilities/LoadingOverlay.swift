//
//  LoadingOverlay.swift
//  ch15_cv_challenge
//
//  Created by Dardo Matias Mansilla on 02/04/2021.
//
import UIKit

public class LoadingOverlay {
  // MARK: - Properties
  var activityIndicatorStyle = UIActivityIndicatorView.Style.medium
  var overlayView = UIView()
  var activityIndicator = UIActivityIndicatorView()
  // MARK: - Initializer
  static func instantiate() -> LoadingOverlay {
    return LoadingOverlay()
  }
  // MARK: - Singleton
  class var shared: LoadingOverlay {
    struct Static {
      static let instance: LoadingOverlay = LoadingOverlay()
    }
    return Static.instance
  }
  // MARK: - Methods
  func hide() {
    activityIndicator.stopAnimating()
    overlayView.removeFromSuperview()
  }
  
  func show(over view: UIView?) {
    hide()
    overlayView = UIView()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = overlayView.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    overlayView.addSubview(blurEffectView)
    
    activityIndicator = UIActivityIndicatorView(style: activityIndicatorStyle)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    overlayView.addSubview(activityIndicator)
    overlayView.addConstraint(overlayView.centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor))
    overlayView.addConstraint(overlayView.centerYAnchor.constraint(equalTo: activityIndicator.centerYAnchor))
    activityIndicator.startAnimating()
    
    view?.addEmbedded(view: overlayView)
  }
}
