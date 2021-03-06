//
//  DeleveryMainViewController.swift
//  DeleveryApplication
//
//  Created by LEO YANG on 2021/09/28.
//

import UIKit

class DeleveryMainViewController: UIViewController {
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var currentPage: Int = 0
    let imageArray = [
        UIImage(named: "banner03.png"),
        UIImage(named: "banner02.png"),
        UIImage(named: "banner01.png")
    ]
    
    let viewModel = DeleveryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        slideTimer()
    }
    
    func slideTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.slideMove()
        }
    }
    
    func slideMove() {
        if currentPage == imageArray.count - 1 {
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            currentPage = 0
            return
        }
        
        currentPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: currentPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOrder" {
            let vc = segue.destination as? DetailOrderViewController
            if let index = sender as? Int {
                let deleveryInfo = viewModel.deleveryInfo(at: index)
                vc?.viewModel.update(model: deleveryInfo)
            }
        }
    }
}

extension DeleveryMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == bannerCollectionView {
            return imageArray.count
        }
        
        
        return viewModel.numberOfdeleveryInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerCollectionViewCell
            cell.bannerImage.image = imageArray[indexPath.row]
            return cell
        }
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as? IconCell else {
            return UICollectionViewCell()
        }
        
        let orderInfo = viewModel.deleveryInfo(at: indexPath.row)
        cell.updateView(orderInfo)
        return cell
    }
}


extension DeleveryMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView != bannerCollectionView {
            performSegue(withIdentifier: "showOrder", sender: indexPath)
        }
    }
}


extension DeleveryMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == bannerCollectionView {
            return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.height)
        }
        
        
        let spacingOfItem: CGFloat = 150
        let textSpaceHeight: CGFloat = 20
    
        let width: CGFloat = (collectionView.bounds.width - spacingOfItem) / 4
        let height: CGFloat = (width + textSpaceHeight)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}


class DeleveryViewModel {
    let deleveryInfoList: [DeleveryInfo] = [
        DeleveryInfo(name: "??????????????????"),
        DeleveryInfo(name: "1??????"),
        DeleveryInfo(name: "?????????"),
        DeleveryInfo(name: "????????????"),
        DeleveryInfo(name: "??????"),
        DeleveryInfo(name: "??????"),
        DeleveryInfo(name: "??????????????????"),
        DeleveryInfo(name: "????????????????????????"),
        DeleveryInfo(name: "??????"),
        DeleveryInfo(name: "??????"),
        DeleveryInfo(name: "??????????????????"),
        DeleveryInfo(name: "?????????"),
        DeleveryInfo(name: "???????????????"),
        DeleveryInfo(name: "??????"),
        DeleveryInfo(name: "?????????"),
        DeleveryInfo(name: "?????????"),
    ]
    
    var numberOfdeleveryInfoList: Int {
        return deleveryInfoList.count
    }
    
    func deleveryInfo(at index: Int) -> DeleveryInfo {
        return deleveryInfoList[index]
    }
}


class IconCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateView(_ deleveryInfo: DeleveryInfo) {
        imageView.image = deleveryInfo.image
        nameLabel.text = deleveryInfo.name
    }
}
