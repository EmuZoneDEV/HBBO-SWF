﻿package _Str_451
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni._Str_9542;

    public class _Str_8746 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8746(k:Function)
        {
            super(k, _Str_9542);
        }

        public function _Str_2273():_Str_9542
        {
            return _parser as _Str_9542;
        }
    }
}
