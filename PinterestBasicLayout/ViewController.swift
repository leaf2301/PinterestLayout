//
//  ViewController.swift
//  PinterestBasicLayout
//
//  Created by Tran Hieu on 03/12/2023.
//

import UIKit
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


class ViewController: UIViewController {
    let colors: [UIColor] = [.cyan, .green, .blue, .yellow, .purple, .orange, .cyan, .green, .blue, .yellow, .purple, .orange, .cyan, .green, .blue, .yellow, .purple, .orange]


    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let layout = PinterestLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
        let size = CGRectGetWidth(collectionView.bounds)/2
    }


    private func setupViews() {
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.contentInset = .init(top: 23, left: 5, bottom: 10, right: 5)

        
        
        collectionView.collectionViewLayout = layout
        layout.cellPadding = 5
        layout.delegate = self
        layout.numberOfColumns = 2
        
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        cell.backgroundColor = colors[indexPath.item]
        cell.configure(url: URL(string: urlStrings[indexPath.item])!)
        return cell
    }
    
    
}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let random = arc4random_uniform(4) + 1
        return CGFloat(random * 100)

    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        return 60
    }
}





let urlStrings: [String] = [
    "https://mfiles.alphacoders.com/100/1002747.jpg", "https://mfiles.alphacoders.com/100/1004253.jpg", "https://mfiles.alphacoders.com/100/1005447.jpg", "https://mfiles.alphacoders.com/100/1006701.jpg",
"https://mfiles.alphacoders.com/100/1005916.jpeg",
"https://mfiles.alphacoders.com/100/1006845.jpeg",

    "https://mfiles.alphacoders.com/100/1002747.jpg", "https://mfiles.alphacoders.com/100/1004253.jpg", "https://mfiles.alphacoders.com/100/1005447.jpg", "https://mfiles.alphacoders.com/100/1006701.jpg",
    "https://mfiles.alphacoders.com/100/1005916.jpeg",
    "https://mfiles.alphacoders.com/100/1006845.jpeg",
    "https://mfiles.alphacoders.com/100/1002747.jpg", "https://mfiles.alphacoders.com/100/1004253.jpg", "https://mfiles.alphacoders.com/100/1005447.jpg", "https://mfiles.alphacoders.com/100/1006701.jpg",
    "https://mfiles.alphacoders.com/100/1005916.jpeg",
    "https://mfiles.alphacoders.com/100/1006845.jpeg"
]
