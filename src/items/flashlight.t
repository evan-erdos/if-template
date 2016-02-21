
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


/** `flashlight` : **`Flashlight`**
 *
 * This is the main `Lamp` for the `user`.
 **/
flashlight : Flashlight
'(metal) flash/flashlight/light/li'
'flashlight' @root
"""
Your flashlight is thin, and made from a very heavy metal. You would have a hard time breaking it, but the batteries don't last that long.
""" {
    isLit = null;
    brightnessOn = 4;
    bulk = 2;
    weight = 2;
}

