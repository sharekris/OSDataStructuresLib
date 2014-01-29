//
//  OSDataStructuresLibTests.m
//  OSDataStructuresLibTests
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import <XCTest/XCTest.h>

#import "OSDataStructures.h"

@interface OSDataStructuresLibTests : XCTestCase {
    OSMutableGraph *mutableGraph;
}


@end

@implementation OSDataStructuresLibTests


- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSError *error = nil;
    mutableGraph = [[OSMutableGraph alloc] initWithGraphType:UnDirected];
    
    OSGraphNode *nodeClearWater = [[OSGraphNode alloc] initWithName:@"Clear Water" andNodeObject:nil];
    OSGraphNode *nodeDaytonaBeach = [[OSGraphNode alloc] initWithName:@"Daytona Beach" andNodeObject:nil];
    OSGraphNode *nodeFtLauderdale = [[OSGraphNode alloc] initWithName:@"Ft. Lauderdale" andNodeObject:nil];
    OSGraphNode *nodeGainesville = [[OSGraphNode alloc] initWithName:@"Gainesville" andNodeObject:nil];
    OSGraphNode *nodeJacksonville = [[OSGraphNode alloc] initWithName:@"Jacksonville" andNodeObject:nil];
    OSGraphNode *nodeKeyLargo = [[OSGraphNode alloc] initWithName:@"Key Largo" andNodeObject:nil];
    OSGraphNode *nodeMiami = [[OSGraphNode alloc] initWithName:@"Miami" andNodeObject:nil];
    OSGraphNode *nodeOrlando = [[OSGraphNode alloc] initWithName:@"Orlando" andNodeObject:nil];
    OSGraphNode *nodeSarasota = [[OSGraphNode alloc] initWithName:@"Sarasota" andNodeObject:nil];
    OSGraphNode *nodeTampa = [[OSGraphNode alloc] initWithName:@"Tampa" andNodeObject:nil];
    
    [mutableGraph addNode:nodeClearWater error:&error];
    [mutableGraph addNode:nodeDaytonaBeach error:&error];
    [mutableGraph addNode:nodeFtLauderdale error:&error];
    [mutableGraph addNode:nodeGainesville error:&error];
    [mutableGraph addNode:nodeJacksonville error:&error];
    [mutableGraph addNode:nodeKeyLargo error:&error];
    [mutableGraph addNode:nodeMiami error:&error];
    [mutableGraph addNode:nodeOrlando error:&error];
    [mutableGraph addNode:nodeSarasota error:&error];
    [mutableGraph addNode:nodeTampa error:&error];

    //[mutableGraph addEdge:nodeClearWater toNode:nodeDaytonaBeach withWeight:159 error:&error];
    //[mutableGraph addEdge:nodeClearWater toNode:nodeFtLauderdale withWeight:247 error:&error];
    [mutableGraph addEdge:nodeClearWater toNode:nodeGainesville withWeight:131 error:&error];
    [mutableGraph addEdge:nodeClearWater toNode:nodeJacksonville withWeight:197 error:&error];
    // [mutableGraph addEdge:nodeClearWater toNode:nodeKeyLargo withWeight:296 error:&error];
    //[mutableGraph addEdge:nodeClearWater toNode:nodeMiami withWeight:262 error:&error];
    //[mutableGraph addEdge:nodeClearWater toNode:nodeOrlando withWeight:106 error:&error];
    //[mutableGraph addEdge:nodeClearWater toNode:nodeSarasota withWeight:53 error:&error];
    // [mutableGraph addEdge:nodeClearWater toNode:nodeTampa withWeight:22 error:&error];
    
    [mutableGraph addEdge:nodeDaytonaBeach toNode:nodeFtLauderdale withWeight:230 error:&error];
    //[mutableGraph addEdge:nodeDaytonaBeach toNode:nodeGainesville withWeight:97 error:&error];
    [mutableGraph addEdge:nodeDaytonaBeach toNode:nodeJacksonville withWeight:89 error:&error];
    // [mutableGraph addEdge:nodeDaytonaBeach toNode:nodeKeyLargo withWeight:309 error:&error];
    //[mutableGraph addEdge:nodeDaytonaBeach toNode:nodeMiami withWeight:255 error:&error];
    //[mutableGraph addEdge:nodeDaytonaBeach toNode:nodeOrlando withWeight:54 error:&error];
    //[mutableGraph addEdge:nodeDaytonaBeach toNode:nodeSarasota withWeight:181 error:&error];
    // [mutableGraph addEdge:nodeDaytonaBeach toNode:nodeTampa withWeight:138 error:&error];
    
    //[mutableGraph addEdge:nodeFtLauderdale toNode:nodeGainesville withWeight:309 error:&error];
    //[mutableGraph addEdge:nodeFtLauderdale toNode:nodeJacksonville withWeight:317 error:&error];
    [mutableGraph addEdge:nodeFtLauderdale toNode:nodeKeyLargo withWeight:80 error:&error];
    //[mutableGraph addEdge:nodeFtLauderdale toNode:nodeMiami withWeight:26 error:&error];
    //[mutableGraph addEdge:nodeFtLauderdale toNode:nodeOrlando withWeight:206 error:&error];
    //[mutableGraph addEdge:nodeFtLauderdale toNode:nodeSarasota withWeight:200 error:&error];
    // [mutableGraph addEdge:nodeFtLauderdale toNode:nodeTampa withWeight:232 error:&error];
    
    //[mutableGraph addEdge:nodeGainesville toNode:nodeJacksonville withWeight:68 error:&error];
    //[mutableGraph addEdge:nodeGainesville toNode:nodeKeyLargo withWeight:372 error:&error];
    //[mutableGraph addEdge:nodeGainesville toNode:nodeMiami withWeight:332 error:&error];
    [mutableGraph addEdge:nodeGainesville toNode:nodeOrlando withWeight:109 error:&error];
    //[mutableGraph addEdge:nodeGainesville toNode:nodeSarasota withWeight:177 error:&error];
    // [mutableGraph addEdge:nodeGainesville toNode:nodeTampa withWeight:128 error:&error];
    
    // [mutableGraph addEdge:nodeJacksonville toNode:nodeKeyLargo withWeight:396 error:&error];
    [mutableGraph addEdge:nodeJacksonville toNode:nodeMiami withWeight:342 error:&error];
    [mutableGraph addEdge:nodeJacksonville toNode:nodeOrlando withWeight:134 error:&error];
    [mutableGraph addEdge:nodeJacksonville toNode:nodeSarasota withWeight:237 error:&error];
    // [mutableGraph addEdge:nodeJacksonville toNode:nodeTampa withWeight:190 error:&error];
    
    [mutableGraph addEdge:nodeKeyLargo toNode:nodeMiami withWeight:54 error:&error];
    // [mutableGraph addEdge:nodeKeyLargo toNode:nodeOrlando withWeight:269 error:&error];
    // [mutableGraph addEdge:nodeKeyLargo toNode:nodeSarasota withWeight:243 error:&error];
    // [mutableGraph addEdge:nodeKeyLargo toNode:nodeTampa withWeight:287 error:&error];
    
    [mutableGraph addEdge:nodeMiami toNode:nodeOrlando withWeight:229 error:&error];
    [mutableGraph addEdge:nodeMiami toNode:nodeSarasota withWeight:214 error:&error];
    // [mutableGraph addEdge:nodeMiami toNode:nodeTampa withWeight:246 error:&error];
    
    // [mutableGraph addEdge:nodeOrlando toNode:nodeSarasota withWeight:128 error:&error];
    [mutableGraph addEdge:nodeOrlando toNode:nodeTampa withWeight:85 error:&error];
    
    // [mutableGraph addEdge:nodeSarasota toNode:nodeTampa withWeight:52 error:&error];
    
    NSArray *arrayOfEdges = [mutableGraph findShortestPathFromNode:nodeTampa toNode:nodeKeyLargo];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
