//com.sulake.habbo.communication.messages.outgoing.game.lobby.GameUnloadedMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.lobby{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GameUnloadedMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GameUnloadedMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.lobby

