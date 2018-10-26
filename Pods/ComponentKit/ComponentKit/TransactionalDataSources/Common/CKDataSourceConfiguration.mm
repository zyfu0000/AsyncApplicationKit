/*
 *  Copyright (c) 2014-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "CKDataSourceConfiguration.h"
#import "CKDataSourceConfigurationInternal.h"

#import "CKEqualityHashHelpers.h"
#import "CKMacros.h"

@implementation CKDataSourceConfiguration
{
  CKSizeRange _sizeRange;
  std::unordered_set<CKComponentScopePredicate> _componentPredicates;
  std::unordered_set<CKComponentControllerScopePredicate> _componentControllerPredicates;
}

- (instancetype)initWithComponentProvider:(Class<CKComponentProvider>)componentProvider
                                  context:(id<NSObject>)context
                                sizeRange:(const CKSizeRange &)sizeRange
{
  return [self initWithComponentProvider:componentProvider
                                 context:context
                               sizeRange:sizeRange
                     unifyBuildAndLayout:NO
                             forceParent:NO
            parallelInsertBuildAndLayout:NO
   parallelInsertBuildAndLayoutThreshold:0
            parallelUpdateBuildAndLayout:NO
   parallelUpdateBuildAndLayoutThreshold:0
                     componentPredicates:{}
           componentControllerPredicates:{}
                       analyticsListener:nil];
}

- (instancetype)initWithComponentProvider:(Class<CKComponentProvider>)componentProvider
                                  context:(id<NSObject>)context
                                sizeRange:(const CKSizeRange &)sizeRange
                      unifyBuildAndLayout:(BOOL)unifyBuildAndLayout
                              forceParent:(BOOL)forceParent
             parallelInsertBuildAndLayout:(BOOL)parallelInsertBuildAndLayout
    parallelInsertBuildAndLayoutThreshold:(NSUInteger)parallelInsertBuildAndLayoutThreshold
             parallelUpdateBuildAndLayout:(BOOL)parallelUpdateBuildAndLayout
    parallelUpdateBuildAndLayoutThreshold:(NSUInteger)parallelUpdateBuildAndLayoutThreshold
                      componentPredicates:(const std::unordered_set<CKComponentScopePredicate> &)componentPredicates
            componentControllerPredicates:(const std::unordered_set<CKComponentControllerScopePredicate> &)componentControllerPredicates
                        analyticsListener:(id<CKAnalyticsListener>)analyticsListener
{
  if (self = [super init]) {
    _componentProvider = componentProvider;
    _context = context;
    _sizeRange = sizeRange;
    _componentPredicates = componentPredicates;
    _componentControllerPredicates = componentControllerPredicates;
    _analyticsListener = analyticsListener;
    _unifyBuildAndLayout = unifyBuildAndLayout;
    _forceParent = forceParent;
    _parallelInsertBuildAndLayout = parallelInsertBuildAndLayout;
    _parallelInsertBuildAndLayoutThreshold = parallelInsertBuildAndLayoutThreshold;
    _parallelUpdateBuildAndLayout = parallelUpdateBuildAndLayout;
    _parallelUpdateBuildAndLayoutThreshold = parallelUpdateBuildAndLayoutThreshold;
  }
  return self;
}

- (const std::unordered_set<CKComponentScopePredicate> &)componentPredicates
{
  return _componentPredicates;
}

- (const std::unordered_set<CKComponentControllerScopePredicate> &)componentControllerPredicates
{
  return _componentControllerPredicates;
}

- (const CKSizeRange &)sizeRange
{
  return _sizeRange;
}

- (BOOL)isEqual:(id)object
{
  if (![object isKindOfClass:[CKDataSourceConfiguration class]]) {
    return NO;
  } else {
    CKDataSourceConfiguration *obj = (CKDataSourceConfiguration *)object;
    return (_componentProvider == obj.componentProvider
            && (_context == obj.context || [_context isEqual:obj.context])
            && _sizeRange == obj.sizeRange);
  }
}

- (NSUInteger)hash
{
  NSUInteger hashes[2] = {
    [_context hash],
    _sizeRange.hash()
  };
  return CKIntegerArrayHash(hashes, CK_ARRAY_COUNT(hashes));
}

@end
