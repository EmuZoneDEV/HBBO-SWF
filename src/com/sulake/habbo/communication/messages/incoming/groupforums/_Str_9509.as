﻿package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_5953;

    public class _Str_9509 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9509(k:Function)
        {
            super(k, _Str_5953);
        }

        public function _Str_2273():_Str_5953
        {
            return _Str_5953(this._parser);
        }
    }
}
