﻿package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8106;

    public class _Str_8695 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8695(k:Function)
        {
            super(k, _Str_8106);
        }

        public function _Str_2273():_Str_8106
        {
            return _parser as _Str_8106;
        }
    }
}
