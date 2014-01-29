//
//  OSMutableGraph.h
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

// A mutable graph basically allows one to create a graph and add nodes and edges to it. Then one can run algorithms on the graph to do basic computations.
// The graph can be Directed or UnDirected.
// The edges can have a weight associated with it.
// The nodes can have an object associated with it.

#import <Foundation/Foundation.h>
#import "Defines.h"
#import "OSGraphEdge.h"
#import "OSGraphNode.h"

@interface OSMutableGraph : NSObject <NSCopying> {
    GraphType _gType;
    NSMutableDictionary *dictionaryOfNodes;
}

- (BOOL) addNode:(OSGraphNode*)graphNode error:(NSError* __autoreleasing *)error;
- (BOOL) removeNode:(OSGraphNode*)graphNode error:(NSError* __autoreleasing *)error;
- (OSGraphEdge*) addEdge:(OSGraphNode*)fromNode toNode:(OSGraphNode*)toNode withWeight:(double)weight error:(NSError* __autoreleasing *)error;
- (NSArray*) findShortestPathFromNode:(OSGraphNode*)fromNode toNode:(OSGraphNode*)toNode;
- (OSMutableGraph*) copy;
- (OSGraphNode*) nodeByName:(NSString*)name error:(NSError* __autoreleasing *)error;
- (NSArray*) getAllNodes;
- (id) initWithGraphType:(GraphType) graphType;

@end
