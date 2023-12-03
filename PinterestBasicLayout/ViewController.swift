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
        setupViews()
        let size = CGRectGetWidth(collectionView.bounds)/2
    }


    private func setupViews() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        collectionView.collectionViewLayout = layout
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
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    
}

extension ViewController: PinterestLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        let random = arc4random_uniform(4) + 1
        return CGFloat(random * 100)
    }
}
