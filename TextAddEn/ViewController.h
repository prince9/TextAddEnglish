//
//  ViewController.h
//  TextAddEn
//
//  Created by 真有 津坂 on 12/04/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //追加
    int x,y;
}
//テキスト入力、Text input
@property (weak, nonatomic) IBOutlet UITextField *myField;
//入力したテキストをそのまま表示、The inputted text is displayed. 
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
//文字列を検索して特定の文字列があるかどうか判定、あるかないかを表示
@property (weak, nonatomic) IBOutlet UILabel *Judg;

@property (weak, nonatomic) IBOutlet UIImageView *myimage;

@property (weak, nonatomic) IBOutlet UIImageView *myimage2;
//特定の文字列を特定の文字列に加える
@property (weak, nonatomic) IBOutlet UILabel *Add;


- (IBAction)textInput:(id)sender;
//文字列検索判定+文字追加開始ボタン
- (IBAction)JudgBtn:(id)sender;

@end
