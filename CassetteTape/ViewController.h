//
//  ViewController.h
//  CassetteTape
//
//  Created by Kevin Johnson on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    bool play;
}
@property (weak, nonatomic) IBOutlet UIImageView *spoolTop;
@property (weak, nonatomic) IBOutlet UIImageView *spoolBottom;

@end
