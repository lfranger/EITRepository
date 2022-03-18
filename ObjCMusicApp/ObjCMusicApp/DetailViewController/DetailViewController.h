//
//  DetailViewController.h
//  ObjCMusicApp
//
//  Created by Consultant on 3/17/22.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *bandName;
@property (strong, nonatomic) IBOutlet UIImageView *bandImage;
@property (strong, nonatomic) IBOutlet UILabel *bandDescription;

@property (strong, nonatomic) NSArray *DetailBand;
