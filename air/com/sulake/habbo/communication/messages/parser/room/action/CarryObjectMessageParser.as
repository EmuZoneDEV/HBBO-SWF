//com.sulake.habbo.communication.messages.parser.room.action.CarryObjectMessageParser

package com.sulake.habbo.communication.messages.parser.room.action{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CarryObjectMessageParser implements IMessageParser {

        private var _userId:int;
        private var _itemType:int;

        public function CarryObjectMessageParser();

        public function get userId():int;

        public function get itemType():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.action

