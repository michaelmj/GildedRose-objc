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
      [self updateQuality];
   }
}

-(void) increaseQuality
{
   if([self quality] < 50)
   {
      [self setQuality: [self quality] + 1];
   }
}

-(void) decreaseQuality
{
   if([self quality] > 0 && ![self isLegendary])
   {
      [self setQuality: [self quality] - 1];
   }
}

-(void) updateQuality
{
   if([self name] != @"Aged Brie" && [self name] != @"Backstage passes to a TAFKAL80ETC concert")
   {
      [self decreaseQuality];
      
      if ( [[self name] isEqualToString:@"Conjured Mana Cake" ] )
      {
         [self decreaseQuality];
      }
   }
   else
   {
      [self increaseQuality];
      
      if( [self name] == @"Backstage passes to a TAFKAL80ETC concert")
      {
         if ( [self sellIn] < 0 )
         {
            [self setQuality: 0];
         }
         else
         {
            if([self sellIn] < 11)
            {
               [self increaseQuality];
            }
            
            if([self sellIn] < 6)
            {
               [self increaseQuality];
            }
         }
      }
   }
}

@end
