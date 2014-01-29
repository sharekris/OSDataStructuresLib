//
//  OSNodeContext.h
//  OSDataStructuresLib
//
//  Created by Kris S on 1/28/14.
//
//

#import <Foundation/Foundation.h>

@interface OSNodeContext : NSObject

@property (assign) BOOL visited;
@property (strong) NSMutableArray *pathSoFar;
@property (assign) float pathWeight;

@end