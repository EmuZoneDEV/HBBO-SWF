﻿package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7904;

    public class _Str_8312 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8312(k:Function)
        {
            super(k, _Str_7904);
        }

        public function _Str_2273():_Str_7904
        {
            return _parser as _Str_7904;
        }
    }
}
