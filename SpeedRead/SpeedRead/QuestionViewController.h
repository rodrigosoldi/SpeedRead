//
//  QuestionViewController.h
//  SpeedRead
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 2/10/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UIButton *alternative1Button;
@property (weak, nonatomic) IBOutlet UIButton *alternative2Button;
@property (weak, nonatomic) IBOutlet UIButton *alternative3Button;
@property (weak, nonatomic) IBOutlet UIButton *alternative4Button;
@end
