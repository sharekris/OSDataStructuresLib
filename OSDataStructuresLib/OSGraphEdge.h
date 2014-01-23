//
//  GraphEdge.h
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import <Foundation/Foundation.h>
#import "OSGraphNode.h"

@interface OSGraphEdge : NSObject <NSCopying>  {

}

@property (nonatomic) double weight;
@property (nonatomic) OSGraphNode *fromGraphNode;
@property (nonatomic) OSGraphNode *toGraphNode;

@end
