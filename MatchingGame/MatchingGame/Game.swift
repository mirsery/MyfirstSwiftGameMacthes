//
//  Game.swift
//  MatchingGame
//
//  Created by mirsery on 15/11/21.
//  Copyright © 2015年 mirsery. All rights reserved.
//

import Foundation
import UIKit

var score:NSMutableArray=NSMutableArray()
class GameSceneViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameSoreLabel.text = "Matches:\(self.matchCounter),Guesses:\(self.guessCounter)"
       self.ShuffledTiles()
    }
    
    var backTitleImage :UIImage = UIImage(named: "back.png")!
    var blankTitleImage :UIImage = UIImage(named: "blank.png")!
   
    var titles:NSMutableArray = NSMutableArray(objects:
        UIImage(named: "icons01.png")!,
        UIImage(named: "icons02.png")!,
        UIImage(named: "icons03.png")!,
        UIImage(named: "icons04.png")!,
        UIImage(named: "icons05.png")!,
        UIImage(named: "icons06.png")!,
        UIImage(named: "icons07.png")!,
        UIImage(named: "icons08.png")!,
        UIImage(named: "icons09.png")!,
        UIImage(named: "icons10.png")!,
        UIImage(named: "icons11.png")!,
        UIImage(named: "icons12.png")!,
        UIImage(named: "icons13.png")!,
        UIImage(named: "icons14.png")!,
        UIImage(named: "icons15.png")!,
        UIImage(named: "icons01.png")!,
        UIImage(named: "icons02.png")!,
        UIImage(named: "icons03.png")!,
        UIImage(named: "icons04.png")!,
        UIImage(named: "icons05.png")!,
        UIImage(named: "icons06.png")!,
        UIImage(named: "icons07.png")!,
        UIImage(named: "icons08.png")!,
        UIImage(named: "icons09.png")!,
        UIImage(named: "icons10.png")!,
        UIImage(named: "icons11.png")!,
        UIImage(named: "icons12.png")!,
        UIImage(named: "icons13.png")!,
        UIImage(named: "icons14.png")!,
        UIImage(named: "icons15.png")!
    )
    
    var isDisabled = false
    var titleFlipped: NSInteger = -1
    var isMatch = false
    var title1: UIButton = UIButton()
    var title2: UIButton = UIButton()
    
    @IBOutlet weak var gameSoreLabel:UILabel!
    var matchCounter : NSInteger = 0
    var guessCounter: NSInteger = 0
    
    
    @IBAction func titleClicked(sender: AnyObject) {
        
        if (isDisabled==true ){return }
        let senderID :Int = sender.tag
        
        if(self.titleFlipped>=0 && senderID != self.titleFlipped ){
            self.title2 = sender as! UIButton
            var lastImage :UIImage = self.titles.objectAtIndex(self.titleFlipped) as! UIImage
            var titleImage:UIImage  = self.titles.objectAtIndex(senderID) as! UIImage
            sender.setImage(titleImage, forState: UIControlState.Normal)
            self.titleFlipped = -1
            isDisabled = true
            guessCounter++
            
            if(titleImage==lastImage){
                self.title1.enabled = false
                self.title2.enabled = false //先锁定按钮，将按钮置于不可用状态
                self.matchCounter++
                isMatch = true
            }

        }else{
            self.titleFlipped =  senderID
            self.title1 = sender as! UIButton
            let titleImage:UIImage = self.titles.objectAtIndex(senderID) as! UIImage
            sender.setImage(titleImage, forState: UIControlState.Normal)
    }
        //定时器
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("resetTiles"), userInfo: nil, repeats: false)
        
        //显示猜测次数
        gameSoreLabel.text = "Matches:\(self.matchCounter),Guesses:\(self.guessCounter)"
    }
    
    func resetTiles(){
        if isMatch {
            self.title1.setImage(self.blankTitleImage, forState: UIControlState.Normal)
            self.title2.setImage(self.blankTitleImage, forState: UIControlState.Normal)
            
            isDisabled = false
            isMatch  = false
            if(self.matchCounter==(self.titles.count/2)){
                self.winner()
            }
            
        }else if isDisabled {
            self.title1.setImage(self.backTitleImage, forState: UIControlState.Normal)
            self.title2.setImage(self.backTitleImage, forState: UIControlState.Normal)
            isDisabled = false
        }
    }

    func winner(){
        self.gameSoreLabel.text="You won with \(self.guessCounter) Guesses"
        var alert = UIAlertView(title: "game is over", message: "is save the number of guess", delegate: self, cancelButtonTitle: "No")
        alert.addButtonWithTitle("yes")
        alert.show()
    }
    func alertView(_alertView:UIAlertView,clickedButtonAtIndex buttonIndex:Int){
        var name:NSString = _alertView.buttonTitleAtIndex(buttonIndex)!
        if(name.isEqualToString("yes")){
            score.addObject(self.gameSoreLabel.text!)
//            var sb = UIStoryboard(name: "Main", bundle:nil)
//            var vc = sb.instantiateViewControllerWithIdentifier("scorelist") as scorelist
//            self.presentViewController(vc, animated:true, completion:nil)
        
        }
    }
    
    
    //让反转后的卡牌随机生成
    var shuffledTiles : NSMutableArray = NSMutableArray()
    func ShuffledTiles(){
        var tileCount:Int = titles.count //得到button总数量
        var tileID:Int = 0
        for(tileID;tileID<(tileCount/2);tileID++){
            self.shuffledTiles.addObject(tileID)
            self.shuffledTiles.addObject(tileID)
        }
        var i: UInt32 = 0
        for(i;i<UInt32(tileCount);i++){
            var nElements:UInt32 = UInt32(tileCount)-i
            var a = arc4random()
            var b = a % nElements
            var n = b+i
            self.shuffledTiles.exchangeObjectAtIndex(Int(i), withObjectAtIndex: Int(n))
            self.titles.exchangeObjectAtIndex(Int(i), withObjectAtIndex: Int(n))
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
	