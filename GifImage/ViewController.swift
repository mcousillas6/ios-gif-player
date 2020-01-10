//
//  ViewController.swift
//  GifImage
//
//  Created by Mauricio Cousillas on 1/10/20.
//  Copyright © 2020 Mauricio Cousillas. All rights reserved.
//

import UIKit
import SwiftGifOrigin

extension UIImageView {
  func loadGif(from url: URL) {
    guard let data = try? Data(contentsOf: url) else {
      print("Failed to load url")
      return
    }

    let gifImage = UIImage.gif(data: data)
    image = gifImage
  }
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view       view.backgroundColor = .white

    let gifURL = URL(string: "https://media.giphy.com/media/12NUbkX6p4xOO4/giphy.gif")!

    let imageView = UIImageView()
    imageView.loadGif(from: gifURL)

    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageView)

    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    ])
  }

}

