//
//  ViewController.m
//  TextAddEn
//
//  Created by 真有 津坂 on 12/04/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize myField;
@synthesize myLabel;
@synthesize Judg;
@synthesize myimage;
@synthesize myimage2;
@synthesize Add;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyField:nil];
    [self setMyLabel:nil];
    [self setJudg:nil];
    [self setMyimage:nil];
    [self setMyimage2:nil];
    [self setAdd:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)textInput:(id)sender {
    //追加、Add
    myLabel.text = myField.text;
}



- (IBAction)JudgBtn:(id)sender {
    
    //以下追加、Add
    
    /* TextFieldに入力した文字列の検索、検索結果はJudg.textに出力
     ・「app」があれば黒いちょうちょをxは20-150、yは120-320の範囲のランダムな位置に表示して、
     白いちょうちょを消します
     ・「store」があれば白いちょうちょをxは20-150、yは120-320の範囲のランダムな位置に表示して、
     黒いちょうちょを消します
     ・該当する文字列がないときは黒いちょうちょ・白いちょうちょともに消します
     */
    
    //文字列検索の準備、Search of a character string is prepared. 
    //NSRange 変数(Variable) = [《NSString*》 rangeOfString:《NSString*》];
    
    NSRange searchResult = [myField.text rangeOfString:@"app"];
    NSRange searchResult2 = [myField.text rangeOfString:@"store"];
    
        //入力した文字列に「app」があった場合の処理、Processing when the inputted character string has "app" 
    if (searchResult.location != NSNotFound) {
        Judg.text = @"Yes";
        myimage.image = [UIImage imageNamed:@"fly1omin.png"];
        
        //Xは20-150、yは120-320の範囲でランダムな数を出力、それを画像の表示位置に
        //X outputs a random number in the range of 20-150,X outputs a random number in the range of 120-320.It is made into the display position of a picture. 
        x = arc4random() % 131 + 20;
        y = arc4random() % 201 + 120;
        myimage.center = CGPointMake(x, y);
        myimage2.image = nil;

    }
    
    //入力した文字列に「store」があった場合の処理、Processing when the inputted character string has "store" 
    else if (searchResult2.location != NSNotFound) {
        Judg.text = @"Yes";
        myimage2.image = [UIImage imageNamed:@"fly4mino.png"];
        
        //Xは20-150、yは120-320の範囲でランダムな数を出力、それを画像の表示位置に
        //X outputs a random number in the range of 20-150,X outputs a random number in the range of 120-320.It is made into the display position of a picture. 
        x = arc4random() % 131 + 20;
        y = arc4random() % 201 + 120;
        myimage2.center = CGPointMake(x, y);
        myimage.image = nil;
        
    }
    //入力した文字列に「app」も「store」もなかった場合の処理、Processing when there is neither "app" nor "store" in the inputted character string
    
    else{
        Judg.text = @"None";
        //画像を消す、.image is erased. 
        myimage.image = nil;
        myimage2.image = nil;
    }

    //入力した文字に「not」があった場合は「not」を削除。一応英語にしてますが、日本語でもおk。その場合は「not」を日本語にしてください
    //"not" will be deleted if the inputted character has "not".
    NSRange searchResult3 = [myField.text rangeOfString:@"not"];
    
    if (searchResult3.location != NSNotFound) {
        NSString *str1 = myField.text;
        NSString *str2 = @"not";
        
        //文字列の削除、Deletion of a character string.
        //NSString *文字列3 = [文字列1(←入力された文字列) stringByReplacingOccurrencesOfString:文字列2(←削除する文字列) withString:@""(←消す)];
        //例:入力された文字列が「I do not play tennis. 」、削除する文字列が「not」の場合、以下だと「I do play tennis.」になる
        NSString *str3 = [str1 stringByReplacingOccurrencesOfString:str2 withString:@""];
        Add.text = [NSString stringWithFormat:@"%@",str3];
       
    }
    
    //「not」がなかった場合は入力した文字の先頭に「No_(←半角スペース)」を付け足した文字列をラベルで表示
    //The character string which added "No_" to the head of the inputted character is displayed. 
    else {
        NSString *str4 = @"No ";
        NSString *str5 = myField.text;
        NSString *str6 = [str4 stringByAppendingString:str5];
        Add.text = [NSString stringWithFormat:@"%@",str6];
    }
    

    
    
    
}
@end
