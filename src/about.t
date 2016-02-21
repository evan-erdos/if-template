
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


versionInfo : GameID {
    name = 'My Text Adventure';
    tagline = 'the tagline for my text adventure';
    byline = 'by Me';
    authorEmail = 'my_email@aol.com';
    genre = 'Adventure';
    version = 'v0.1.0';
    firstPublished = '2016';
    IFID = 'TADS3FF0-3DFD-4E23-8419-89B0557C6A19';

    scoreRankTable = [
        [0,  'a commoner'],
        [10, 'a 10-more-points-than-a-commoner'],
        [15, 'a dumb corgi (where\'s my script?)'],
        [20, 'such a good boy, yes you *ARE*!'],
        [32, 'a pretty reasonably intelligent life form.']];


    intro() {
        """<p>
        This is the introduction to your text adventure.
        It's the first thing people will see when they fire this baby up.
        </p>
        """;
    } /* intro */


    title() {
        about();
        """
        <p>(Type <<aHref('about', 'ABOUT')>> for basic information about this game, or <<aHref('restore', 'RESTORE')>> to restore a saved position. To <<aHref('', 'begin the game')>>, just press the Enter key, and type <<aHref('help','HELP')>> once you start if you get stuck.) </p>
        """;
    } /* title */


    about() {
        """
        <p><b><u>
        <<versionInfo.name.toUpper()>></u></b>
        <<versionInfo.tagline>>
        </p><p>
        <center>
        <<versionInfo.byline>>, <<versionInfo.authorEmail>>
        Release <<versionInfo.version>>, <<versionInfo.firstPublished>></p>
        </center>
        """;
    } /* about */
} /* versionInfo */


