//
//  PinterestLayout.swift
//  PinterestBasicLayout
//
//  Created by Tran Hieu on 03/12/2023.
//

import UIKit

protocol PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
    
    var delegate: PinterestLayoutDelegate!
    var numberOfColumns = 1
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0
    private var width: CGFloat {
        get {
            return CGRectGetWidth(collectionView!.bounds)
        }
    }
    
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
        
    override func prepare() {
        
        if cache.isEmpty {
            let columnWidth = width/CGFloat(numberOfColumns)
            
            var xOffsets = [CGFloat]()
            
            for column in 0..<numberOfColumns {
                xOffsets.append(CGFloat(column)*columnWidth)
            }
            
            var yOffsets = [CGFloat](repeating: 0, count: numberOfColumns)
            
            var column = 0
            
            for item in 0..<collectionView!.numberOfItems(inSection: 0) {
                let indexPath = IndexPath(item: item, section: 0)
                let height = delegate.collectionView(collectionView: collectionView!, heightForItemAtIndexPath: indexPath)
                
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: height)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                cache.append(attributes)
                //Scroll
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                yOffsets[column] = yOffsets[column] + height
                
                column = column >= (numberOfColumns - 1) ? 0 : column + 1
            }
            
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in cache {
            if CGRectIntersectsRect(attribute.frame, rect) {
                layoutAttributes.append(attribute)
            }
        }
        
        return layoutAttributes
    }
    
    

    
    
}


func convertStringToWidth(TextArray: [String], font: UIFont, padding: CGFloat) -> [CGFloat] {
    var returnArray: [CGFloat] = []
    
    for item in TextArray {
        let itemSize = item.size(withAttributes: [NSAttributedString.Key.font : font])
        
        let width: CGFloat = itemSize.width + padding
        returnArray.append(width)
    }
    return returnArray
}
