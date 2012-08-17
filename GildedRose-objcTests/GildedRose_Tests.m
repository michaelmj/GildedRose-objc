//
//  GildedRose_objcTests.m
//  GildedRose-objcTests
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose_Tests.h"
#import "GildedRose.h"


static NSMutableString * _multiIterationOutput(GildedRose *rose)
{
   NSMutableString * output = [NSMutableString string];
   
   for ( int i = 0; i < 10; i++ )
   {
      [output appendFormat:@"Inventory after iteration %d \r\n%@", i, [rose dump]];
      [rose updateQuality];
   }
   
   return output;
}

@implementation GildedRose_Tests

- (void)test_CreatingRoseShouldNotFail
{
   GildedRose * rose = [GildedRose new];
   STAssertNotNil(rose, @"Rose creation was not successful");
}

- (void) test_RoseShouldImplementUpdateQuality
{
   GildedRose * rose = [GildedRose new];
   STAssertTrue([rose respondsToSelector:@selector(updateQuality)], @"Must implement the base functionality");
}

//- (void) test_WriteOutBaseVersionOfOutput
//{
//   GildedRose * rose = [GildedRose new];
//   
//   NSMutableString *output = _multiIterationOutput(rose);
//   [output writeToFile:@"startingTestOutput.txt" atomically:NO encoding:NSUTF8StringEncoding error:nil];
//}
@end
