﻿package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_8594;

    public class _Str_5767 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5767(k:Function)
        {
            super(k, _Str_8594);
        }

        public function _Str_2273():_Str_8594
        {
            return this._parser as _Str_8594;
        }
    }
}
