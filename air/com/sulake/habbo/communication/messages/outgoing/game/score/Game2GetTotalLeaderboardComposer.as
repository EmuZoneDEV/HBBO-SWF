//com.sulake.habbo.communication.messages.outgoing.game.score.Game2GetTotalLeaderboardComposer

package com.sulake.habbo.communication.messages.outgoing.game.score{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2GetTotalLeaderboardComposer implements IMessageComposer {

        private var _data:Array;

        public function Game2GetTotalLeaderboardComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.score

