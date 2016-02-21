
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


leaflet : Thing
'(small) leaflet' 'leaflet' @root
"""
The leaflet is quite short, and has a tear along the top edge. It reads "... the most amazing territory ever seen by mortals. No computer should be without one!" At the end is what looks like a serial number, <tt>69105</tt>. Typical.
""" {
    initSpecialDesc =
        """
        There's a leaflet here, held down by a rock. An edge flutters in the breeze.
        """;
    initDesc =
        """
        It's just a small piece of paper. You have no idea how it hasn't blown away yet.
        """;
}

