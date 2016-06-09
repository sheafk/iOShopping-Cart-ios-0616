//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Shea Furey-King on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"


@implementation FISShoppingCart


-(NSUInteger)calculateTotalPriceInCents {
    
    NSArray *total = [self.items valueForKey:@"priceInCents"];
    
    NSUInteger sum = 0;
    for (NSUInteger i=0; i > [total count]; i++) {
        
        NSUInteger b = (NSUInteger)total[i];
        sum = sum + b;
    }
    
    NSLog(@"What is the total?: %@", total);
    NSLog(@"");
    
    return sum;
}

-(void)addItem:(FISItem *)item{
    
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item {
    
    NSUInteger indexOfItem = [self.items indexOfObject:item];
    
    [self.items removeObjectAtIndex:indexOfItem];
    
}

-(void)removeAllItemsLikeItem:(FISItem *)item {
    
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sortAbc = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortAbc];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:sortDescriptors];
    
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:sortedArray];

}

-(void)sortItemsByNameDesc {
    NSSortDescriptor *sortAbc = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                            ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortAbc];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:sortDescriptors];
    
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:sortedArray];
}

-(void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortAbc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents"
                                                            ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortAbc];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:sortDescriptors];
    
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:sortedArray];
}

-(void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *sortAbc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents"
                                                            ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortAbc];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:sortDescriptors];
    
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:sortedArray];
}

-(NSArray *)allItemsWithName:(NSString *)name {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name IN %@", name];
    NSArray *allItemsWithName = [self.items filteredArrayUsingPredicate:predicate];
    
    return allItemsWithName;
}

-(NSArray *)allItemsWithMinimumPriceInCents: (NSUInteger)min {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"priceInCents >= %@", min];
    NSArray *allItemsWithMinimumPrice = [self.items filteredArrayUsingPredicate:predicate];
    
    return allItemsWithMinimumPrice;
}

-(NSArray *)allItemsWithMaximumPriceInCents: (NSUInteger)max {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"priceInCents <= %@", max];
    NSArray *allItemsWithMaximumPrice = [self.items filteredArrayUsingPredicate:predicate];
    
    return allItemsWithMaximumPrice;
}

@end
