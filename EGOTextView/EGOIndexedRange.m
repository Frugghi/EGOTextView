//
//  EGOIndexedRange.m
//
//  Created by Devin Doty on 4/18/11.
//  Copyright (C) 2011 by enormego.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGOIndexedRange.h"
#import "EGOIndexedPosition.h"

@implementation EGOIndexedRange

+ (EGOIndexedRange *)rangeWithNSRange:(NSRange)theRange {
    if (theRange.location == NSNotFound) return nil;
    
    EGOIndexedRange *range = [[EGOIndexedRange alloc] init];
    range.range = theRange;
    return range;
}

- (UITextPosition *)start {
    return [EGOIndexedPosition positionWithIndex:self.range.location];
}

- (UITextPosition *)end {
	return [EGOIndexedPosition positionWithIndex:(self.range.location + self.range.length)];
}

- (BOOL)isEmpty {
    return (self.range.length == 0);
}

- (id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
		[copy setRange:self.range];
    }
	
    return copy;
}

- (BOOL)isEqual:(id)object {
	if ([object isKindOfClass:[EGOIndexedRange class]]) {
        return NSEqualRanges([((EGOIndexedRange *)object) range], self.range);
	}
	return NO;
}

- (NSUInteger)hash {
	return [NSStringFromRange(self.range) hash];
}

- (NSString *)description {
    return NSStringFromRange(self.range);
}

@end
