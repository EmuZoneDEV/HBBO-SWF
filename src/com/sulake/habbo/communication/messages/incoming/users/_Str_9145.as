﻿package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_7205;

    public class _Str_9145 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9145(k:Function)
        {
            super(k, _Str_7205);
        }

        public function _Str_2273():_Str_7205
        {
            return _parser as _Str_7205;
        }
    }
}
