﻿package com.sulake.core.communication
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.communication.connection.IConnectionStateListener;
    import com.sulake.core.communication.connection.IConnection;

    public interface ICoreCommunicationManager extends IUnknown 
    {
        function _Str_20941(_arg_1:IConnectionStateListener=null):IConnection;
    }
}
