In M3 macbook, using NSGraphicsContext.current will casue the memory has increased by 400MB and drops after drawing
<img width="800" alt="image" src="https://github.com/miku1958/NSGraphicsContext-memory-issue/assets/24806909/377b1b5f-0d14-4ed8-b071-5afb1dca0224">


Funny thing is, if I reduce the height of window to a certain value, the memory issue suddenly disappear
<img width="800" alt="image" src="https://github.com/miku1958/NSGraphicsContext-memory-issue/assets/24806909/c9b9e3a7-bff5-4d73-9387-daca2ba3a535">

PS1: This problem also occurs in SwiftUI.Canvas and Chart

PS2: Not sure, this increased memory looks like the purgeable memory, but sometimes it show 0.
<img width="800" alt="image" src="https://github.com/miku1958/NSGraphicsContext-memory-issue/assets/24806909/29bd7e02-e470-41c7-8c9f-d9f52ba659dc">

