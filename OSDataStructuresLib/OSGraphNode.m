//
//  GraphNode.m
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import "OSGraphNode.h"

@implementation OSGraphNode
@synthesize name=_name, nodeObject=_nodeObject, nodeContext, dictionaryOfEdges;

- (id) initWithName:(NSString*) name andNodeObject:(id) obj
{
    self = [super init];
    if (self)
    {
        _name = name;
        _nodeObject = obj;
        dictionaryOfEdges = [[NSMutableDictionary alloc] init];
        return self;
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

- (BOOL) addEdge:(OSGraphEdge*) edge error:(NSError* __autoreleasing *)error
{
    [dictionaryOfEdges setValue:edge forKey:edge.toGraphNode.name];
    return true;
}

- (NSArray*) getAllEdges
{
    return [dictionaryOfEdges allValues];
}

- (id) copyWithZone:(NSZone *)zone
{
    OSGraphNode __autoreleasing *newNode = [[OSGraphNode alloc] initWithName:_name andNodeObject:_nodeObject];
    return newNode;
}
@end
