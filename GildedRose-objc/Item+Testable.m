//
//  Item+Testable.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/20/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "Item+Testable.h"

@implementation Item (Testable)
-(BOOL) isLegendary
{
   return [[self name] isEqualToString:@"Sulfuras, Hand of Ragnaros"];
}

@end
