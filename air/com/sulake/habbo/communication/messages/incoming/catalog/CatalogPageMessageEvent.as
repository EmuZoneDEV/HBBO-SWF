//com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser;

    [SecureSWF(rename="true")]
    public class CatalogPageMessageEvent extends MessageEvent implements IMessageEvent {

        public function CatalogPageMessageEvent(k:Function);

        public function getParser():CatalogPageMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

