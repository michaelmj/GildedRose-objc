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

- (void)updateSellIn
{
   if( ![self isLegendary] )
   {
      [self setSellIn: [self sellIn] - 1];
   }
}

- (void)ageItem
{
   [self updateQuality];
   [self updateSellIn];
   
   if([self sellIn] < 0)
   {
      if([self name] != @"Aged Brie")
      {
         if([self name] != @"Backstage passes to a TAFKAL80ETC concert")
         {
            if([self quality] > 0)
            {
               if( ![self isLegendary] )
               {
                  [self setQuality: [self quality] - 1];
               }
            }
         }
         else
         {
            [self setQuality: 0];
         }
      }
      else
      {
         if([self quality] < 50)
         {
            [self setQuality: [self quality] + 1];
         }
      }
   }
}

-(void) updateQuality
{
   if([self name] != @"Aged Brie" && [self name] != @"Backstage passes to a TAFKAL80ETC concert")
   {
      if([self quality] > 0)
      {
         if( ![self isLegendary] )
         {
            [self setQuality: [self quality] - 1];
         }
      }
   }
   else
   {
      if([self quality] < 50)
      {
         [self setQuality: [self quality] + 1 ];
         
         if([self name] == @"Backstage passes to a TAFKAL80ETC concert")
         {
            if([self sellIn] < 11)
            {
               if([self quality] < 50)
               {
                  [self setQuality: [self quality] + 1];
               }
            }
            
            if([self sellIn] < 6)
            {
               if([self quality] < 50)
               {
                  [self setQuality: [self quality] + 1];
               }
            }
         }
      }
   }
}

@end
