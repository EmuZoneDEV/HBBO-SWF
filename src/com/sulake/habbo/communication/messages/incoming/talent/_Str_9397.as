﻿package com.sulake.habbo.communication.messages.incoming.talent
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent._Str_7381;

    public class _Str_9397 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9397(k:Function)
        {
            super(k, _Str_7381);
        }

        public function _Str_2273():_Str_7381
        {
            return _parser as _Str_7381;
        }
    }
}
