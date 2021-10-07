//
//  ViewController.swift
//  SSACDAY1-2
//
//  Created by LEO YANG on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var previewCollectionView: UICollectionView!

    let random = Int.random(in: 1...10)
    let previewImageList = ["poster1",
                            "poster2",
                            "poster3",
                            "poster4",
                            "poster5",
                            "poster6",
                            "poster7",
                            "poster8",
                            "poster9",
                            "poster10",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
        backgroundImage.image = UIImage(named: "poster\(random)")
    }
    
    func makeCircleView(viewName: UIView) {
        let borderLayer = CALayer()
        borderLayer.frame = viewName.bounds
        viewName.clipsToBounds = true
        viewName.layer.borderWidth = 3
        viewName.layer.borderColor = UIColor.gray.cgColor
        viewName.layer.cornerRadius = viewName.frame.width / 2
        viewName.layer.insertSublayer(borderLayer, above: viewName.layer)
    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
        let random = Int.random(in: 1...10)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.alpha = 1
        
        UIView.animate(withDuration: 3) {
            self.backgroundImage.image = UIImage(named: "poster\(random)")
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previewImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! CollectionViewCell
        cell.clipsToBounds = true
        cell.layer.cornerRadius = cell.frame.width / 2
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.previewImage.image = UIImage(named: previewImageList[indexPath.row])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 9
        let width = collectionView.frame.size.width
        return CGSize(width: width / (numberOfCells / 2), height: width / (numberOfCells / 2))
    }
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
  let numberOfCells: CGFloat = 3
  let width = collectionView.frame.size.width - (flowLayout.minimumInteritemSpacing * (numberOfCells - 1))
  return CGSize(width: width / (numberOfCells), height: width / (numberOfCells))
}
