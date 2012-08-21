//
//  GildedRose_objc.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose.h"
#import "Item+Testable.h"

@implementation GildedRose

- (void)updateQuality
{
   [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      [obj ageItem];
   }];
}

@end
