//
//  GraphEdge.h
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import <Foundation/Foundation.h>

@class OSGraphNode;

@interface OSGraphEdge : NSObject  {

}

@property (nonatomic) double weight;
@property (nonatomic) OSGraphNode *fromGraphNode;
@property (nonatomic) OSGraphNode *toGraphNode;
@property (nonatomic) id edgeContext;
@property (nonatomic) id edgeObject;

@end
