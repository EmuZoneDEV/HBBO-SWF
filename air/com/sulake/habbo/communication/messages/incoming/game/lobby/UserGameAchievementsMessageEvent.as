//com.sulake.habbo.communication.messages.incoming.game.lobby.UserGameAchievementsMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.UserGameAchievementsMessageParser;

    [SecureSWF(rename="true")]
    public class UserGameAchievementsMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserGameAchievementsMessageEvent(k:Function);

        public function getParser():UserGameAchievementsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

