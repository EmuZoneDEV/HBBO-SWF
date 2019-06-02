//com.sulake.habbo.communication.messages.incoming.help.ChatReviewSessionVotingStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionVotingStatusMessageParser;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionVotingStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function ChatReviewSessionVotingStatusMessageEvent(k:Function);

        public function getParser():ChatReviewSessionVotingStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

