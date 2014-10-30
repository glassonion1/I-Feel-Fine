//
//  ViewController.swift
//  CollectionView
//
//  Created by taisuke fujita on 2014/06/25.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    override func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return 12;
    }
    
    override func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
                as UICollectionViewCell
            let image = UIImage(named: "hedgehog")
            let imageView = UIImageView(image: image) as UIImageView
            let radian = CGFloat(M_PI / 180) * CGFloat(30 * indexPath.row)
            imageView.transform = CGAffineTransformMakeRotation(radian)
            cell.addSubview(imageView)
            return cell
    }
    
    override func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            if kind != UICollectionElementKindSectionHeader {
                return super.collectionView(collectionView,
                    viewForSupplementaryElementOfKind: kind,
                    atIndexPath: indexPath);
            }
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(
                kind,
                withReuseIdentifier: "Header",
                forIndexPath: indexPath) as UICollectionReusableView
            let label = UILabel(frame: CGRect(x: 5, y: 5, width: 200, height: 40))
            label.backgroundColor = UIColor.clearColor()
            label.text = "画像の角度を変えてみる"
            header.addSubview(label)
            return header;
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: 60, height: 60)
    }
}

