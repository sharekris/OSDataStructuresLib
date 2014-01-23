//
//  OSMutableGraph.m
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import "OSMutableGraph.h"

@implementation OSMutableGraph
    

- (id) init
{
    self = [super init];
    if (self)
    {
        dictionaryOfNodes = [[NSMutableDictionary alloc] init];
        return self;
    }
    
    return nil;
}


- (BOOL) addNode:(OSGraphNode*)graphNode error:(NSError* __autoreleasing *)error
{
    [dictionaryOfNodes setValue:graphNode forKey:graphNode.name];
    return TRUE;
}

- (BOOL) removeNode:(OSGraphNode*)graphNode error:(NSError* __autoreleasing *)error
{
    // This method will find the node, remove it and also remove the edges that this node shares.
    OSGraphNode *node = [dictionaryOfNodes valueForKey:graphNode.name];
    if (node)
    {
        [dictionaryOfNodes removeObjectForKey:graphNode.name];
    }
    return TRUE;
}

- (OSGraphEdge*) addEdge:(OSGraphNode*)fromNode toNode:(OSGraphNode*)toNode withWeight:(double)weight error:(NSError* __autoreleasing *)error
{
    NSMutableDictionary *dictionaryOfEdges = fromNode.dictionaryOfEdges;
    if ([dictionaryOfEdges valueForKey:toNode.name])
    {
        *error = [[NSError alloc] initWithDomain:@"Edge already exists" code:1001 userInfo:nil];
        return [dictionaryOfEdges valueForKey:toNode.name];
    }
    
    OSGraphEdge *newEdge = [fromNode addEdgeToNode:toNode withWeight:weight error:error];

    return newEdge;
}

- (id) copyWithZone:(NSZone *)zone
{
    OSMutableGraph *newGraph = [[OSMutableGraph alloc] init];
    
    for (OSGraphNode *eachNode in dictionaryOfNodes)
    {
        OSGraphNode *eachNewNode = [eachNode copy];
        NSError *error = nil;
        [newGraph addNode:eachNewNode error:&error];
    }
    
    return newGraph;
}

- (void) recursiveCopy:(OSGraphNode*)node intoDictionary:(NSMutableDictionary*)dictionaryCopyOfNodes
{
    OSGraphNode *existingNode = [dictionaryCopyOfNodes valueForKey:node.name];
    if (existingNode) return;  // Exit criteria
    
    for (OSGraphNode *eachNode in dictionaryOfNodes)
    {
        OSGraphNode *newNode = [[OSGraphNode alloc] init];
        newNode.name = [NSString stringWithFormat:@"%@", eachNode.name];
        
        for (OSGraphEdge *eachEdge in eachNode.adjacencyList)
        {
            [self recursiveCopy:eachEdge.toGraphNode intoDictionary:dictionaryCopyOfNodes];
            NSError *error = nil;
            [newNode addEdgeToNode:eachEdge.toGraphNode withWeight:eachEdge.weight error:&error];
        }
    }
}

- (NSArray*) findShortestPathFromNode:(OSGraphNode*)fromNode toNode:(OSGraphNode*)toNode
{
    // The shortest path algorithm is a recursive algorithm that takes a starting node and recursively goes through the entire tree to reach the destination node, each time calculating
    // the cumulative weight along the edges. The shortest path will then be the
    
    return nil;
}

@end
