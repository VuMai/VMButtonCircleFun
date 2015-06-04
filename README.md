# VMButtonCircleFun
https://youtu.be/oAhPnSlvG3s

#Author
VuMai

https://vumai.me

## Overview ##

VMButtonCircleFun is an button iOS control.It is generated on the screen with cute effects.You can change it any way if you like this.

## How to use ##

First, you need to copy 2 files VMButtonCircleFun.h/.m and Images icon to your project. Then, import them to your class

```objc
#import "VMButtonCircleFun.h"
```

Now you can add this funtions to show VMGearsLoading:

```objc
    VMButtonCircleFun *circleView = [[VMButtonCircleFun alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [circleView addCircleLayerWithType:VMMakeLocationTop]; ( * )
    [circleView setStrokeColor:rgb(243, 106, 106)]; ( 1 )
    [circleView setCenter:CGPointMake(CGRectGetWidth(self.view.bounds)/2 - 100, CGRectGetHeight(self.view.bounds)/2)];
    [circleView setIconButton:[UIImage imageNamed:@"Layer 14.png"] withType:VMMakeLocationTop withColor:rgb(127, 140, 141)]; ( 2 )
    [circleView setLineWidthValue:1]; ( 3 )
    [self.view addSubview:circleView1];
    [circleView buildButton]; ( 4 )
```
Let’s run through this method step by step:

*: 2 type of VMButtonCircleFun:

        - VMMakeLocationTop: button started from top
        
        - VMMakeLocationBottom: button started from bottom

1: set line color

2: set icon of button with color

3: set line width

4: importan! if you don't use this function button will not appear. 


## Release notes

Version 1.0

## MIT License
Copyright (c) 2015 VuMai

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
