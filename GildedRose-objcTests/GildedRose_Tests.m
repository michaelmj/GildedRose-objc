//
//  GildedRose_objcTests.m
//  GildedRose-objcTests
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose_Tests.h"
#import "GildedRose.h"

@implementation GildedRose_Tests

- (void)test_CreatingRoseShouldNotFail
{
   GildedRose * rose = [GildedRose new];
   STAssertNotNil(rose, @"Rose creation was not successful");
}

@end
