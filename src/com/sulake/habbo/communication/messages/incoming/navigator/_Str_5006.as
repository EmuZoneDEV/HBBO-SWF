﻿package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6885;

    public class _Str_5006 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5006(k:Function)
        {
            super(k, _Str_6885);
        }

        public function _Str_2273():_Str_6885
        {
            return this._parser as _Str_6885;
        }
    }
}
