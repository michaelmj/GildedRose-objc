//
//  Item+Testable.h
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/20/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "HereBeDragons.h"

@interface Item (Testable)
-(BOOL) isLegendary;
-(void) ageItem;
-(void) increaseQuality;
-(void) decreaseQuality;
@end
