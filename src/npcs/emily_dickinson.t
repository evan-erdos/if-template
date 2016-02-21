
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


emily_dickinson : Person
'em/emmy/emily/emily dickinson/dickinson'
'Emily' @room_0
"""
She sits quietly in a stiff wooden chair. She is deathly pale, and you know what color she's wearing.
""" {
    isHer = true;

    desc =
        """
        A solemn thing - it was - I said -
        A Woman - White - to be -
        And wear - if God should count me fit -
        Her blameless mystery -

        F 307 (1862) 271
        """;

    isProperName = true;
    properName = 'Emily Dickinson';
    globalParamName = 'emily';
}

+ NPCWorn '(summer) white frock/dress/housedress' 'dress'
"""
It's a very clean, very white housedress.
""" {
    isListed = (!isIn(emily_dickinson));
}


