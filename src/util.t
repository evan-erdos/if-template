
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


/* begin modifications */

// Passage template -> masterObject 'vocabWords' 'name' @location? "desc"?
// Door template 'name' @room1 @room2;

//Room template [rooms] "desc"?;
//alternate format, includes up / down, etc.
//[northwest, north, northeast] //[[NW,  U,  N,  NE],
//[west,    'roomName',   east] // [W,  IN, OUT, E ],
//[southwest, south, southeast]; // [SW, D,   S,  SE]]

modify Goal {
    setGoalState(state) { goalState = state; }
}

modify YellAction {
    execAction() { mainReport('You bark as loud as you can. '); }
}


modify Thing {
    dobjFor(BarkAt) {
        verify() {
            illogical('{The dobj/he} {is} not something you can bark at. '); }
    }

    dobjFor(Purloin) {
        verify() {
            illogical('{you/he} can\'t steal {that dobj/him}! ');
        }
    }
}


modify Actor {
    makeProper() {
        if (isProperName==null && properName!=null) {
            name = properName;
            isProperName = true;
            initializeVocabWith(properName);
        } return name;
    }
}


modify statusLine {
    showStatusRight() {
        "<<user.name>> - <<versionInfo.name>> - ";
        inherited();
    }
}


enum Male, Female;


class StaticGoal : Goal {
    goalState = OpenGoal;
}


class Ambiance : RandomFiringScript, ShuffledEventList {
    eventPercent = 50;
}


Ambiance template [eventList];

/* end modifications */



/* begin events */
Events : object {

    sleep() { }

    propertyset '*Typewriter' {
        count = 1;
        input = '';
        daemon = null;

        init(s, delay) {
            if (daemonTypewriter==null) {
                inputTypewriter = s;
                daemonTypewriter = new RealTimeDaemon(
                    self,&advanceTypewriter,delay);
            }
        }

        advance() {
            if (countTypewriter<=inputTypewriter.length()) {
                cls();
                print(inputTypewriter.substr(1,countTypewriter));
                countTypewriter++;
            } else if (daemonTypewriter!=null) {
                daemonTypewriter.removeEvent;
                daemonTypewriter = null;
            }
        }
    }
}


util : object {

    capitalize(s) {
        if (s.length()<1) return s.toUpper();
        return s[0].toUpper()+s.substr(1);
    }

    censor : StringPreParser {
        doParsing(s, which) {
            if (rexMatch(util.obscenities,s.toLower())!=null) {
                util.offenses+=1;
                if (util.offenses>8) {
                    "Come back when you've classed it up a bit.";
                    finishGameMsg('You have missed the point entirely.',null); }
                else if (util.offenses>7)
                    "Be very careful.";
                else if (util.offenses>6)
                    "Tenacious, huh?";
                else if (util.offenses>5)
                    "I'll do something awful if you keep this up.";
                else if (util.offenses>4)
                    "No, you're right, this is hilarious.";
                else if (util.offenses>3)
                    "How was middle school for you?";
                else if (util.offenses>2) "Try me.";
                else if (util.offenses>1) "Knock it off.";
                else if (util.offenses>0) "Be careful.";
                return null;
            } return s;
        }
    }

    suppressOutput : OutputFilter {
        filterText(tgt,src) { return ' '; } }

    // straightforward? no, but it keeps the repo classy.
    obscenities = '%b([^a-eg-z0-9][^a-tv-z0-9][^abd-z0-9][^a-jl-z0-9])|([^a-rt-z0-9][^a-gi-z0-9][^a-hj-z0-9][^a-su-z0-9])%b';
    offenses = 0;
}


