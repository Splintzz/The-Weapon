//
//  main.m
//  The Weapon
//
//  Created by Spencer Carr on 2/7/19.
//  Copyright © 2019 Spencer Carr. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
