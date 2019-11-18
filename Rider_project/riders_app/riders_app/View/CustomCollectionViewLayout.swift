//
//  CustomCollectionViewLayout.swift
//  riders_app
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit


public protocol CustomLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForCellAtIndexPath indexPath: IndexPath, width: CGFloat) -> CGFloat
}


class CustomCollectionViewLayout: UICollectionViewLayout {

}
