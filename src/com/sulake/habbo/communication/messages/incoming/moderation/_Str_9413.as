﻿package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7467;

    public class _Str_9413 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9413(k:Function)
        {
            super(k, _Str_7467);
        }

        public function _Str_2273():_Str_7467
        {
            return _parser as _Str_7467;
        }
    }
}
