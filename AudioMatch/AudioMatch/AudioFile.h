//
//  AudioFile.h
//  AudioMatch
//
//  Created by Xiao Xiao on 4/6/15.
//  Copyright (c) 2015 SeanLionheart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface AudioFile : NSObject

@property (nonatomic, retain, readonly) NSString *path;

@property (nonatomic, assign, readonly) UInt64 frames;

- (instancetype)initWithPath:(NSString *)path;

- (double)matchAudioFile:(AudioFile *)anotherAudio;

@end
