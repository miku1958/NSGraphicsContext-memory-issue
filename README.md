In M3 macbook, using NSGraphicsContext.current will casue the memory has increased by 400MB and drops after drawing
<img width="937" alt="image" src="https://github.com/miku1958/NSGraphicsContext-memory-issue/assets/24806909/377b1b5f-0d14-4ed8-b071-5afb1dca0224">


Funny thing is, if I reduce the height of window to a certain value, the memory issue suddenly disappear
<img width="922" alt="image" src="https://github.com/miku1958/NSGraphicsContext-memory-issue/assets/24806909/c9b9e3a7-bff5-4d73-9387-daca2ba3a535">

PS1: This problem also occurs in SwiftUI.Canvas and Chart

PS2: Not sure, this increased memory looks like the shared memory
<img width="671" alt="image" src="https://github.com/miku1958/NSGraphicsContext-memory-issue/assets/24806909/1b293e90-36e5-444b-9754-0b9ea09bd38d">
