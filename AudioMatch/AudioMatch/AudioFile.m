//
//  AudioFile.m
//  AudioMatch
//
//  Created by Xiao Xiao on 4/6/15.
//  Copyright (c) 2015 SeanLionheart. All rights reserved.
//

#import "AudioFile.h"

@implementation AudioFile {
    ExtAudioFileRef _audioFile;
}

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self) {
        _path = path;
        [self loadAudioFile];
    }
    return self;
}

- (void)loadAudioFile
{
    NSURL *pathURL = [NSURL URLWithString:self.path];
    OSStatus status = ExtAudioFileOpenURL((__bridge CFURLRef)pathURL, &_audioFile);
    assert(status == noErr);
    UInt32 frameLengthPropertySize = sizeof(_frames);
    status = ExtAudioFileGetProperty(_audioFile, kExtAudioFileProperty_FileLengthFrames, &frameLengthPropertySize, &_frames);
    assert(status == noErr);
    status = ExtAudioFileDispose(_audioFile);
    assert(status == noErr);
}

- (double)matchAudioFile:(AudioFile *)anotherAudio
{
    return NO;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"AudioFle %@: frames: %llu", self.path, self.frames];
}


@end
