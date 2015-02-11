//
//  SettingsViewController.h
//  SpeedRead
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 2/10/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *numberOfWordsSegmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *testingComprehensionSegmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *numberOfQuestionsSlider;
@end
