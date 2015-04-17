package com
{
	import flash.display.Sprite; 
	import flash.net.InterfaceAddress; 
	import flash.net.NetworkInfo; 
	import flash.net.NetworkInterface; 
	
	public class NetworkInformation extends Sprite 
	{ 
		public function NetworkInformation() 
		{ 
			var networkInfo:NetworkInfo = NetworkInfo.networkInfo; 
			var interfaces:Vector.<NetworkInterface> = networkInfo.findInterfaces(); 
			
			if( interfaces != null ) 
			{ 
				Trace.log( "Interface count: " + interfaces.length ); 
				for each ( var interfaceObj:NetworkInterface in interfaces ) 
				{ 
					Trace.log( "\nname: "       + interfaceObj.name ); 
					Trace.log( "display name: "   + interfaceObj.displayName ); 
					Trace.log( "mtu: "         + interfaceObj.mtu ); 
					Trace.log( "active?: "       + interfaceObj.active ); 
					Trace.log( "parent interface: " + interfaceObj.parent ); 
					Trace.log( "hardware address: " + interfaceObj.hardwareAddress ); 
					if( interfaceObj.subInterfaces != null ) 
					{ 
						Trace.log( "# subinterfaces: " + interfaceObj.subInterfaces.length ); 
					} 
					Trace.log("# addresses: "   + interfaceObj.addresses.length ); 
					for each ( var address:InterfaceAddress in interfaceObj.addresses ) 
					{ 
						Trace.log( " type: "      + address.ipVersion ); 
						Trace.log( " address: "     + address.address ); 
						Trace.log( " broadcast: "     + address.broadcast ); 
						Trace.log( " prefix length: "   + address.prefixLength ); 
					} 
				}       
			} 
		}   
	} 
}