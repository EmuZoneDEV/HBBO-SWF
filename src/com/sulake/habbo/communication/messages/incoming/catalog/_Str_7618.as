﻿package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_4625;

    public class _Str_7618 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7618(k:Function)
        {
            super(k, _Str_4625);
        }

        public function _Str_2273():_Str_4625
        {
            return this._parser as _Str_4625;
        }
    }
}
