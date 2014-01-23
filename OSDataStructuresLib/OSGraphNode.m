//
//  GraphNode.m
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import "OSGraphNode.h"

@implementation OSGraphNode
@synthesize name, nodeObject, dictionaryOfEdges;

- (id) init
{
    self = [super init];
    if (self)
    {
        dictionaryOfEdges = [[NSMutableDictionary alloc] init];
        return self;
    }
    
    return nil;
}

- (id) copyWithZone:(NSZone *)zone
{
    OSGraphNode *newNode = [[OSGraphNode alloc] init];
    
    for (OSGraphEdge *eachEdge in dictionaryOfEdges)
    {
        OSGraphEdge *newEdge = [eachEdge copy];
    }
    return nil;
}

- (OSGraphEdge*) addEdgeToNode:(OSGraphNode*)toNode withWeight:(double)weight error:(NSError* __autoreleasing *)error
{
    OSGraphEdge *newEdge = [[OSGraphEdge alloc] init];
    newEdge.weight = weight;
    newEdge.fromGraphNode = self;
    newEdge.toGraphNode = toNode;
    
    [dictionaryOfEdges setValue:newEdge forKey:toNode.name];
    
    return newEdge;
}

- (NSArray*) adjacencyList
{
    return [dictionaryOfEdges allValues];
}
@end
