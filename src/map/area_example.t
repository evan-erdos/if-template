
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


area : Area 'Larger Area'
['''
It's very ambient in here, because you're in a larger area.
''','''
A gust of wind blows past you from the <<one of>>north<<or>>south<<or>>east<<or>>west<<at random>>. Or, maybe it doesn't, if it doesn't make sense in your story to have wind in this area.
''']
"""
Not only are you in the room you're in, but you're also in a larger area.

""";


room_0 : AreaRoom -> area 'Room 0'
"""
This is the first room!
""" {
    west = room_1;
}

+ root_door_1 : AutoClosingDoor -> root_door_0
'(wooden) portal/porthole/exit/door*doors' 'door'
"""
The door to you room is here.
""" {
    reportAutoClose { "You close the door behind you. "; };
}


room_1 : AreaRoom -> area 'Room 1'
"""
This is the second room, being that it's Room 1!
""" {
    east = room_0;
}



