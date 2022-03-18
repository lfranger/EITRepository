//
//  DetailViewController.m
//  ObjCMusicApp
//
//  Created by Consultant on 3/17/22.
//

#import "DetailViewController.h"

@end

@interface DetailViewController()

@end

@implementation DetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    _bandName.text = _DetailBand[0];
    _bandImage.image = [UIImage imageNamed: _DetailBand[1]];
    _bandDescription.text = _DetailBand[2];
}

@end
