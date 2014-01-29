//
//  OSNodeContext.m
//  OSDataStructuresLib
//
//  Created by Kris S on 1/28/14.
//
//

#import "OSNodeContext.h"

@implementation OSNodeContext
@synthesize visited, pathSoFar, pathWeight;

- (id) init
{
    self = [super init];
    if (self)
    {
        pathSoFar = [[NSMutableArray alloc] init];
        pathWeight = MAXFLOAT;
        visited = 0;
        return self;
    }
    
    return nil;
}

@end
