﻿package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_7865;

    public class _Str_8337 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8337(k:Function)
        {
            super(k, _Str_7865);
        }

        public function _Str_2273():_Str_7865
        {
            return _parser as _Str_7865;
        }
    }
}
