//
//  EventAllViewController.swift
//  riders_app
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

struct EventData {
    var imageUrl: String?
    var title: String?
    var des: String?
    var des2: String?
}


class EventAllViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            let layout = LiquidCollectionViewLayout()
            
            layout.delegate = self
//            layout.sectionInset = UIEdgeInset(top: 10, left: 10, bottom: 10, right: 10)
//            layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
//            layout.columnSpacing = 10
//            layout.rowSpacing = 10
//            layout.columnsCount = 10
            collectionView.collectionViewLayout = layout
            
        }
    }
    
    var data = [EventData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var event1 = EventData()
        event1.imageUrl = "image"
        event1.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)Nguyen duc dong, Nguyen duc dong, Nguyen duc dong, Nguyen duc dongNguyen duc dong, Nguyen duc dong"
        event1.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇ 01"
        event1.des2 = "Nguyen duc dong, Nguyen duc dong, Nguyen duc dong,Nguyen duc dong 開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event2 = EventData()
        event2.imageUrl = "image"
        event2.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) Nguyen duc dong, Nguyen duc dong, Nguyen duc dong,Nguyen duc dong "
        event2.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時 02"
        event2.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) Nguyen duc dong, Nguyen duc dong, Nguyen duc dong,Nguyen duc dong "
        
        
        var event3 = EventData()
        event3.imageUrl = "image"
        event3.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event3.des = "開催⽇日時(省省 略略しない)開催⽇日時( 03"
        event3.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event4 = EventData()
        event4.imageUrl = "image"
        event4.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event4.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 04"
        event4.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event5 = EventData()
        event5.imageUrl = "image"
        event5.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event5.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略 05"
        event5.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event6 = EventData()
        event6.imageUrl = "image"
        event6.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event6.des = "開催⽇日時(省省 略略しない)開 06"
        event6.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event7 = EventData()
        event7.imageUrl = "image"
        event7.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event7.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 07"
        event7.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event8 = EventData()
        event8.imageUrl = "image"
        event8.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event8.des = "開催⽇日時(省省 08"
        event8.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        var event9 = EventData()
        event9.imageUrl = "image"
        event9.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event9.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 09"
        event9.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        var event10 = EventData()
        event10.imageUrl = "image"
        event10.title = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        event10.des = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない) 10"
        event10.des2 = "開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)開催⽇日時(省省 略略しない)"
        
        
        data.append(event1)
        data.append(event2)
        data.append(event3)
        data.append(event4)
        data.append(event5)
        data.append(event6)
        data.append(event7)
        data.append(event8)
        data.append(event9)
        data.append(event10)
        

    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.reloadData()
//        self.collectionView.layoutIfNeeded()
        
    }

}

extension EventAllViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! EventDataCell
        
        cell.updateDataCell(data: data[indexPath.item])
        return cell
    }
}

extension EventAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: UIScreen.main.bounds.size.width/2 , height: 1000)

        let rect01 = NSString(string: data[indexPath.item].title!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)

        let rect02 = NSString(string: data[indexPath.item].des!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)

        let rect03 = NSString(string: data[indexPath.item].des2!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)


        let knownHeight = 180 + 8 + 8 + 8 + 1 + 8 + 10

        let totalHeight = rect01.height + rect02.height + rect03.height + CGFloat(knownHeight) + 8


        return CGSize(width: size.width, height: totalHeight)
    }
}

extension EventAllViewController: WaterflowLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let size = CGSize(width: UIScreen.main.bounds.size.width/2, height: 1000)
        
        let rect01 = NSString(string: data[indexPath.item].title!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)
        
        let rect02 = NSString(string: data[indexPath.item].des!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)
        
        let rect03 = NSString(string: data[indexPath.item].des2!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)
        
        
        let knownHeight = 180 + 8 + 8 + 8 + 1 + 8 + 10
        
        let totalHeight = rect01.height + rect02.height + rect03.height + CGFloat(knownHeight) + 8
        return totalHeight
    }
}

extension EventAllViewController: LiquidLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForCellAtIndexPath indexPath: IndexPath, width: CGFloat) -> CGFloat {
        
        let size = CGSize(width: collectionView.bounds.size.width/2 - 25 , height: 1000)
        
        let rect01 = NSString(string: data[indexPath.item].title!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)
        
        let rect02 = NSString(string: data[indexPath.item].des!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)
        
        let rect03 = NSString(string: data[indexPath.item].des2!).boundingRect(with: size, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], context: nil)
        
        
        let knownHeight = 180 + 8 + 8 + 8 + 1 + 8 + 10
        
        let totalHeight = rect01.height + rect02.height + rect03.height + CGFloat(knownHeight) + 10
        return totalHeight
        
    }
}
