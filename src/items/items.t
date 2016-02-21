
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


/** `backpack` : **`BagOfHolding`**
 *
 * This is the main holdall for the `user`. Should be found in
 * one of the starting rooms.
 **/
backpack : BagOfHolding, StretchyContainer
'(my) back/backpack/pack/sack/bag'
'backpack' @root
"""
You've had this pack for awhile. It's somewhat old, but it still carries everything you need to go out adventuring.
""" {
    initSpecialDesc =
        """
        Your tattered backpack is here. You typically don't leave home without it.
        """;
    bulkCapacity = 3000;
    minBulk = 1;
}


/** `keyring` : **`Keyring`**
 *
 * This is the main `Keyring` for the `user`, which should also
 * be situated near the start of the game.
 **/
keyring : Keyring
'(metal) ring/key/keyring*keys rings'
'keyring' @root
"""
Your keyring is kindof barren. It's old enough that it's not as hard to separate it to put keys on, though. So, you've got that going for you, which is nice.
""";

