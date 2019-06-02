//com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.GenericErrorParser;

    [SecureSWF(rename="true")]
    public class GenericErrorEvent extends MessageEvent implements IMessageEvent {

        public function GenericErrorEvent(k:Function);

        public function getParser():GenericErrorParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

